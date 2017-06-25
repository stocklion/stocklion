@sto = Stock.all
@inc = Income.all
require 'date'
@date = Date.today

File.open("stockList.txt") do |f|
  f.each_line do |line|

    puts "#{line}"
    if line.strip! == "Finance"
      skip = 1
      next
    elsif line.strip! == "Other"
      skip = 2
      next
    end
    stockCode = line.strip

    @page_ss = Nokogiri::HTML(open('https://comp.fnguide.com/SVO2/ASP/SVD_Main.asp?pGB=1&gicode='+stockCode+'&cID=&MenuYn=Y&ReportGB=&NewMenuID=101&stkGb=701', :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
    @snapshot = @page_ss.css('div.um_table').css('table.us_table_ty1')
    price = @snapshot.css('tr.rwf').css('td.r').text.tr(',', '').tr('/', '').strip.to_i
    mktCap = @snapshot.css('tr')[3].css('td.r')[0].text.tr(',','').strip.to_i

    @sto.each do |s|
      if s.stockCode == stockCode
        stockid = s.id
        puts "Saving #{price} as last closing price for stock_id #{stockid} on #{@date} in Price table"
        stockPrice = Price.new(stock_id: stockid, price_clo: price, date: @date)
        stockPrice.save

        @inc.each do |i|
          if i.stock_id == stockid
            if i.year == 2017
              if i.quarter == 1
                netIncome = i.netIncome
                pricetoEarning = (mktCap.to_f/netIncome)
                puts "Saving #{pricetoEarning} as price to earnings ratio for stock_id #{stockid} on #{@date} to PriceToEarning table"
                per = PriceToEarning.new(date: @date, stock_id: stockid, ratio: pricetoEarning)
                per.save
              else
                next
              end
            else
              next
            end
          else
            next
          end
        end
      else
        next
      end
    end
  end
end



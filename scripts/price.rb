@sto = Stock.all
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
    @snapshot = @page_ss.css('div.um_table').css('table.us_table_ty1').css('tr.rwf')
    price = @snapshot.css('td.r').text.tr(',', '').tr('/', '').strip.to_i

    @sto.each do |s|
      if s.stockCode == stockCode
        stockid = s.id
        puts "Saving #{price} as last closing price for stock #{stockid} on #{@date} in Price table"
        stockPrice = Price.new(stock_id: stockid, price_clo: price, date: @date)
        stockPrice.save
      else
        next
      end
    end
  end
end



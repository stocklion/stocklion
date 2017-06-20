@bal = Balance.all
@inc = Income.all

@bal.each do |b|
  year = b.year
  quarter = b.quarter
  stockid = b.stock_id
  equity = b.shareholderEquity
  debt = b.liabilities

  if equity == nil
    next
  end

  # calculate debt to equity ratio
  debtRatio = (debt.to_f / equity)
  puts "Saving stock_id #{stockid} year #{year} quarter #{quarter}
				debt to equity ratio #{debtRatio} to DebtToEquity table"
  dte = DebtToEquity.new(year: year, quarter: quarter, stock_id: stockid, ratio: debtRatio)
  dte.save

  # calculate return to equity ratio
  @inc.each do |i|
    if i.stock_id == stockid
      if i.year == year
        if i.quarter == quarter
          netIncome = i.netIncome
          returntoEquity = (netIncome.to_f / equity)
          puts "Saving stock_id #{stockid} year #{year} quarter #{quarter}
				return to equity ratio #{returntoEquity} to ReturnToEquity table"
          roe = ReturnToEquity.new(year: year, quarter: quarter, stock_id: stockid, ratio: returntoEquity)
          roe.save
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
end
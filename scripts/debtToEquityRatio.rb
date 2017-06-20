
@bal = Balance.all

year = 0
quarter = 0
stockid = 0
equity = 0
debt = 0
debtRatio = 0

@bal.each do |b|
	year = b.year
	quarter = b.quarter
	stockid = b.stock_id
	equity = b.shareholderEquity
	debt = b.liabilities

	if equity == nil 
		next
	end

	debtRatio = (debt.to_f / equity)

	puts "Saving stock_id #{stockid} year #{year} quarter #{quarter}
				debt to equity ratio #{debtRatio} to DebtToEquity table"

	dte = DebtToEquity.new(year: year, quarter: quarter, stock_id: stockid, ratio: debtRatio)
	dte.save

  netIncome = Income.find{|i| i.stock_id == stockid}.netIncome
  returntoEquity = (netIncome.to_f / equity)

	puts "Saving stock_id #{stockid} year #{year} quarter #{quarter}
				return to equity ratio #{returntoEquity} to ReturnToEquity table"

  roe = ReturnToEquity.new(year: year, quarter: quarter, stock_id: stockid, ratio: returntoEquity)
  roe.save

end




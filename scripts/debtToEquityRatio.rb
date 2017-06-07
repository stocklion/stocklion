
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
	equity = b.ShareholderEquity
	debt = b.liabilities

	if equity == nil 
		next
	end

	debtRatio = (debt.to_f / equity)

	puts "Saving stock_id #{stockid} year #{year} quarter #{quarter}
debt to equity ratio #{debtRatio} to DebtToEquity table" 

	dte = DebtToEquity.new(year: year, quarter: quarter, stock_id: stockid,
ratio: debtRatio)
	dte.save	
end




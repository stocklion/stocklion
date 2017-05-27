# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rubygems'
require 'nokogiri'
require 'open-uri'


### ---------- Populate Industry table ----------
sector = nil
industryGroup = nil
industry = nil

File.open("industry.txt") do |x|
   x.each_line do |line|
      if line.strip! == "Sector:"
	 sector = 1
	 next
      elsif line.strip! == "IndustryGroup:"
	 industryGroup = 1
	 next
      elsif line.strip! == "Industry:"
	 industry = 1
      	 next
      end
      
      if sector == 1
	sector = line
	next
      elsif industryGroup == 1
        industryGroup = line
      	next
      elsif industry == 1
        industry = line
      else
	industry = line
      end      

      industryData = Industry.new(sectorName:sector, industryGroup:
industryGroup, industryName: industry)
      industryData.save 

   end
end


### ---------- Populate Stock table ----------
File.open("stockList.txt") do |f|
  f.each_line do |line|
    stockCode = line.strip!
    #stockCode_mod = stockCode.tr('A', '')
    @page = Nokogiri::HTML(open('https://comp.fnguide.com/SVO2/asp/SVD_Finance.asp?pGB=1&gicode='+stockCode+'&cID=&MenuYn=Y&ReportGB=&NewMenuID=103&stkGb=701',  :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
    @text = @page.css('div.corp_group1')

    fics = @text.css('p.stxt_group').css('span.stxt.stxt2').text.tr('FICS','').tr('\u00A0', ' ').strip
    #kse = @text.css('p.stxt_group').css('span.stxt.stxt1').text.tr('KSE','').tr('\u00A0', '')

    @industry_finder = Industry.all
    @industry_finder.each do |x|
      if x.industryName == fics
        @industry_id = x.id
      end
    end

    stockName = @text.css('h1#giName').text.strip
    stockxData = Stock.new(stockCode: stockCode, stockName: stockName, industry_id: @industry_id)
    stockxData.save

=begin
    @service_key = 'wBBTcgyoRrkPkO%2B7q4VMnJL3z8RWXNkmcWIH76to4AsrxcIMHd%2FE0rKDGwYijI06WNKX4HVqhtq6fp4i96IvIw%3D%3D'
    co_name = 'http://api.seibro.or.kr/openapi/service/CorpSvc/getIssucoCustnoByShortIsin?shortIsin='+stockCode_mod+'&ServiceKey='+@service_key
    xmlName = Nokogiri::XML(open(co_name, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
    xmlName.xpath("//body").each do |x|
      @stockName = x.at('issucoNm').content
    end
    stockxData = Stock.new(stockCode: stockCode, stockName: @stockName)
    stockxData.save
=end

### ---------- Populate Financial table ----------
    # ---------- Parse Annual Income Statement and save data ----------
    @tabl = @page.css('table.us_table_ty1')[0]
    @data = @tabl.css('tr').css('td')
    
    dataNames = [:revenue, :costOfGoodsSold, :grossProfit, :sellAdminExpense, :employeeSalary, :depreciation_amortization,
                 :r_and_d_expense, :marketingExpense, :sellingExpense, :maintenanceExpense, :otherCostExpense, :otherSellingExpense,
                 :operatingIncome, :financingProfit, :interestIncome, :dividendIncome, :currencyExchangeGains, :allowanceForBadDebts,
                 :accountsReceivable, :gainOnSaleOfFinancialAsset, :gainOnValuationOfFinancialAssets, :recoveryOfImpairmentOnFinancialAssets,
                 :gainOnDerivatives, :otherFinancialIncome, :financingExpense, :interestExpense, :currencyExchangeLoss, :expensesOfAllowanceForDoubtfulAccounts,
                 :accountsReceivableLoss, :lossOnSaleOfFinancialAsset, :lossOnValuationOfFinancialAsset, :impairmentLossOnFinancialAsset, :lossOnDerivatives,
                 :otherFinancialExpense, :otherProfit, :otherInterestIncome, :otherDividendIncome, :otherCurrencyExchangeGain, :gainOnInventory, :gainOnSaleOfInventory,
                 :gainOnSaleOfAsset, :gainOnValuationOfAsset, :gainOnImpairmentLoss, :otherGainOnDerivative, :rentalIncome, :royaltyIncome, :commissionIncome,
                 :gainOnAllowanceForDoubtfulAccount, :gainOnProvision, :otherOtherIncome, :otherExpense, :otherInterestExpense, :otherCurrencyExchangeLoss,
                 :lossOnInventory, :lossOnSaleOfInventory, :lossOnSaleOfAsset, :lossOnValuationOfAsset, :otherImpairmentLoss, :otherLossOnDerivative,
                 :otherExpenseOfAllowanceForDoubtfulAccounts, :lossOnProvision, :otherOtherExpense, :profitFromOccupancy, :gainInEquityMethod, :saleOfSecuritiesGain,
                 :securityImpairmentLoss, :occupancyOther, :ebit, :incomeTaxExpense, :ongoingOperatingIncome, :discontinuedOperatingIncome, :netIncome, :netIncomeOwnersOfParentEquity,
                 :netIncomeNonControllingInterestEquity]
  
    column_set = 0
    column_count = 0
    year = 2014
    quarter = 0
    
    4.times {
      yearx_is = Array.new
      
      @data.each do |i|
        if column_set == column_count
          tabl_data = i.text.strip.gsub(/[\s,]/ ,"")
          yearx_is.push(tabl_data)
          column_count += 1
        else
          column_count += 1
        end
        
        if column_count == 6
          column_count=0
        end
      end
      
      yearxData = Income.new(stock_id: stockxData.id, year: year, quarter: quarter, dataNames[0] => yearx_is[0], dataNames[1] => yearx_is[1],
                                dataNames[2] => yearx_is[2], dataNames[3] => yearx_is[3],dataNames[4] => yearx_is[4],
                                dataNames[5] => yearx_is[5],dataNames[6] => yearx_is[6], dataNames[7] => yearx_is[7],
                                dataNames[8] => yearx_is[8], dataNames[9] => yearx_is[9],dataNames[10] => yearx_is[10],
                                dataNames[11] => yearx_is[11],dataNames[12] => yearx_is[12], dataNames[13] => yearx_is[13],
                                dataNames[14] => yearx_is[14], dataNames[15] => yearx_is[15],dataNames[16] => yearx_is[16],
                                dataNames[17] => yearx_is[17],dataNames[18] => yearx_is[18], dataNames[19] => yearx_is[19],
                                dataNames[20] => yearx_is[20], dataNames[21] => yearx_is[21],dataNames[22] => yearx_is[22],
                                dataNames[23] => yearx_is[23],dataNames[24] => yearx_is[24], dataNames[25] => yearx_is[25],
                                dataNames[26] => yearx_is[26], dataNames[27] => yearx_is[27],dataNames[28] => yearx_is[28],
                                dataNames[29] => yearx_is[29],dataNames[30] => yearx_is[31], dataNames[31] => yearx_is[31],
                                dataNames[32] => yearx_is[32], dataNames[33] => yearx_is[33],dataNames[34] => yearx_is[34],
                                dataNames[35] => yearx_is[35],dataNames[36] => yearx_is[36], dataNames[37] => yearx_is[37],
                                dataNames[38] => yearx_is[38], dataNames[39] => yearx_is[39],dataNames[40] => yearx_is[40],
                                dataNames[41] => yearx_is[41],dataNames[42] => yearx_is[42], dataNames[43] => yearx_is[43],
                                dataNames[44] => yearx_is[44], dataNames[45] => yearx_is[45],dataNames[46] => yearx_is[46],
                                dataNames[47] => yearx_is[47],dataNames[48] => yearx_is[48], dataNames[49] => yearx_is[49],
                                dataNames[50] => yearx_is[50], dataNames[51] => yearx_is[51],dataNames[52] => yearx_is[52],
                                dataNames[53] => yearx_is[53],dataNames[54] => yearx_is[54], dataNames[55] => yearx_is[55],
                                dataNames[56] => yearx_is[56], dataNames[57] => yearx_is[57],dataNames[58] => yearx_is[58],
                                dataNames[59] => yearx_is[59],dataNames[60] => yearx_is[60], dataNames[61] => yearx_is[61],
                                dataNames[62] => yearx_is[62], dataNames[63] => yearx_is[63],dataNames[64] => yearx_is[64],
                                dataNames[65] => yearx_is[65],dataNames[66] => yearx_is[66], dataNames[67] => yearx_is[67],
                                dataNames[68] => yearx_is[68], dataNames[69] => yearx_is[69],dataNames[70] => yearx_is[70],
                                dataNames[71] => yearx_is[71],dataNames[72] => yearx_is[72], dataNames[73] => yearx_is[73])
      yearxData.save
      
      year += 1
      column_set += 1
    }

    # ---------- Parse Quarterly Income Statement and save data ----------
    @tabl = @page.css('table.us_table_ty1')[1]
    @data = @tabl.css('tr').css('td')

    column_set = 0
    column_count = 0
    year = 2016
    quarter = 2

    4.times {
      yearx_is = Array.new

      @data.each do |i|
        if column_set == column_count
          tabl_data = i.text.strip.gsub(/[\s,]/ ,"")
          yearx_is.push(tabl_data)
          column_count += 1
        else
          column_count += 1
        end

        if column_count == 6
          column_count=0
        end
      end

      yearxData = Income.new(stock_id: stockxData.id, year: year, quarter: quarter, dataNames[0] => yearx_is[0], dataNames[1] => yearx_is[1],
                                dataNames[2] => yearx_is[2], dataNames[3] => yearx_is[3],dataNames[4] => yearx_is[4],
                                dataNames[5] => yearx_is[5],dataNames[6] => yearx_is[6], dataNames[7] => yearx_is[7],
                                dataNames[8] => yearx_is[8], dataNames[9] => yearx_is[9],dataNames[10] => yearx_is[10],
                                dataNames[11] => yearx_is[11],dataNames[12] => yearx_is[12], dataNames[13] => yearx_is[13],
                                dataNames[14] => yearx_is[14], dataNames[15] => yearx_is[15],dataNames[16] => yearx_is[16],
                                dataNames[17] => yearx_is[17],dataNames[18] => yearx_is[18], dataNames[19] => yearx_is[19],
                                dataNames[20] => yearx_is[20], dataNames[21] => yearx_is[21],dataNames[22] => yearx_is[22],
                                dataNames[23] => yearx_is[23],dataNames[24] => yearx_is[24], dataNames[25] => yearx_is[25],
                                dataNames[26] => yearx_is[26], dataNames[27] => yearx_is[27],dataNames[28] => yearx_is[28],
                                dataNames[29] => yearx_is[29],dataNames[30] => yearx_is[31], dataNames[31] => yearx_is[31],
                                dataNames[32] => yearx_is[32], dataNames[33] => yearx_is[33],dataNames[34] => yearx_is[34],
                                dataNames[35] => yearx_is[35],dataNames[36] => yearx_is[36], dataNames[37] => yearx_is[37],
                                dataNames[38] => yearx_is[38], dataNames[39] => yearx_is[39],dataNames[40] => yearx_is[40],
                                dataNames[41] => yearx_is[41],dataNames[42] => yearx_is[42], dataNames[43] => yearx_is[43],
                                dataNames[44] => yearx_is[44], dataNames[45] => yearx_is[45],dataNames[46] => yearx_is[46],
                                dataNames[47] => yearx_is[47],dataNames[48] => yearx_is[48], dataNames[49] => yearx_is[49],
                                dataNames[50] => yearx_is[50], dataNames[51] => yearx_is[51],dataNames[52] => yearx_is[52],
                                dataNames[53] => yearx_is[53],dataNames[54] => yearx_is[54], dataNames[55] => yearx_is[55],
                                dataNames[56] => yearx_is[56], dataNames[57] => yearx_is[57],dataNames[58] => yearx_is[58],
                                dataNames[59] => yearx_is[59],dataNames[60] => yearx_is[60], dataNames[61] => yearx_is[61],
                                dataNames[62] => yearx_is[62], dataNames[63] => yearx_is[63],dataNames[64] => yearx_is[64],
                                dataNames[65] => yearx_is[65],dataNames[66] => yearx_is[66], dataNames[67] => yearx_is[67],
                                dataNames[68] => yearx_is[68], dataNames[69] => yearx_is[69],dataNames[70] => yearx_is[70],
                                dataNames[71] => yearx_is[71],dataNames[72] => yearx_is[72], dataNames[73] => yearx_is[73])
      yearxData.save

      quarter += 1
      if quarter==5 
	quarter = 1
	year += 1
      end
      column_set += 1
    }

### ---------- Populate Balance table ---------- 
    # ---------- Parse Annual Balance Sheet and save data ----------
    @tabl = @page.css('table.us_table_ty1')[2]
    @data = @tabl.css('tr').css('td')
    
    dataNames = [:assets, :currentAssets, :inventories, :currentBiologicalAssets, :currentFinancialAssets,
                 :accountsRecievables_and_otherCurrentRecievables, :currentTaxAssets, :otherCurrentAssets, :cah_and_cashEquivalents,
                 :assetHeldforSaleorDisposalGroup, :nonCurrentAssets, :pPE, :intangibleAssets, :nonCurrentBiologicalAssets, :investmentPeroperties,
                 :lTFinancialAssets, :InvestmentsAssociates_Subsidiaries_JointVentures, :lTtradeRecievables_and_otherCurrentRecievables, :deferredTaxAssets,
                 :lTcurrentTaxAssets, :otherNonCurrentAssets, :otherFinancialInstitutionsAssets, :libailities, :currentLiabilities, :sTCorporateBonds,
                 :sTBorrowings, :currentLTliabilites, :currentFinancialLiabilities, :accountsPayable_otherCurrentPayables, :currentProvisionsforEmployeeBenefits,
                 :otherSTProvisions, :currentTaxLiabilities, :otherCurrentLiablities, :assetHeldforSaleorDisposalGroupLiabilities, :nonCurrentLiabilities,
                 :corporateBonds, :lTBorrowings, :nonCurrentFinancialLiabilities, :lTaccountsPayable_otherCurrentPayables, :nonCurrentProvisionsforEmployeeBenefits,
                 :otherLTProvisions, :deferredTaxALiabilities, :lTcurrentTaxLiabilities, :otherNonCurrentLiabilities, :otherFinancialInstitutionsLiabilities,
                 :ShareholderEquity, :ownersofParentEquity, :capitalStock, :structuredCapitalSecurities, :capitalSurplus, :otherReserves,
                 :accumulatedOtherComprehensiveIncome, :retainedEarnings, :nonControllingInterestsEquity]
    
    column_set = 0
    column_count = 0
    year = 2014
    quarter = 0
    
    4.times {
      yearx_bs = Array.new
      
      @data.each do |i|
        if column_set == column_count
          tabl_data = i.text.strip.gsub(/[\s,]/ ,"")
          yearx_bs.push(tabl_data)
          column_count += 1
        else
          column_count += 1
        end
        
        if column_count == 4
          column_count=0
        end
      end
      
      yearxData = Balance.new(stock_id: stockxData.id, year: year, quarter: quarter, dataNames[0] => yearx_bs[0], dataNames[1] => yearx_bs[1],
                              dataNames[2] => yearx_bs[2], dataNames[3] => yearx_bs[3],dataNames[4] => yearx_bs[4],
                              dataNames[5] => yearx_bs[5],dataNames[6] => yearx_bs[6], dataNames[7] => yearx_bs[7],
                              dataNames[8] => yearx_bs[8], dataNames[9] => yearx_bs[9],dataNames[10] => yearx_bs[10],
                              dataNames[11] => yearx_bs[11],dataNames[12] => yearx_bs[12], dataNames[13] => yearx_bs[13],
                              dataNames[14] => yearx_bs[14], dataNames[15] => yearx_bs[15],dataNames[16] => yearx_bs[16],
                              dataNames[17] => yearx_bs[17],dataNames[18] => yearx_bs[18], dataNames[19] => yearx_bs[19],
                              dataNames[20] => yearx_bs[20], dataNames[21] => yearx_bs[21],dataNames[22] => yearx_bs[22],
                              dataNames[23] => yearx_bs[23],dataNames[24] => yearx_bs[24], dataNames[25] => yearx_bs[25],
                              dataNames[26] => yearx_bs[26], dataNames[27] => yearx_bs[27],dataNames[28] => yearx_bs[28],
                              dataNames[29] => yearx_bs[29],dataNames[30] => yearx_bs[31], dataNames[31] => yearx_bs[31],
                              dataNames[32] => yearx_bs[32], dataNames[33] => yearx_bs[33],dataNames[34] => yearx_bs[34],
                              dataNames[35] => yearx_bs[35],dataNames[36] => yearx_bs[36], dataNames[37] => yearx_bs[37],
                              dataNames[38] => yearx_bs[38], dataNames[39] => yearx_bs[39],dataNames[40] => yearx_bs[40],
                              dataNames[41] => yearx_bs[41],dataNames[42] => yearx_bs[42], dataNames[43] => yearx_bs[43],
                              dataNames[44] => yearx_bs[44], dataNames[45] => yearx_bs[45],dataNames[46] => yearx_bs[46],
                              dataNames[47] => yearx_bs[47],dataNames[48] => yearx_bs[48], dataNames[49] => yearx_bs[49],
                              dataNames[50] => yearx_bs[50], dataNames[51] => yearx_bs[51],dataNames[52] => yearx_bs[52],
                              dataNames[53] => yearx_bs[53])
      yearxData.save
      
      year += 1
      column_set += 1
    }

    # ---------- Parse Quarterly Balance Sheet and save data ----------
    @tabl = @page.css('table.us_table_ty1')[3]
    @data = @tabl.css('tr').css('td')

    column_set = 0
    column_count = 0
    year = 2016
    quarter = 1

    4.times {
      yearx_bs = Array.new

      @data.each do |i|
        if column_set == column_count
          tabl_data = i.text.strip.gsub(/[\s,]/ ,"")
          yearx_bs.push(tabl_data)
          column_count += 1
        else
          column_count += 1
        end

        if column_count == 4
          column_count=0
        end
      end

      yearxData = Balance.new(stock_id: stockxData.id, year: year, quarter: quarter, dataNames[0] => yearx_bs[0], dataNames[1] => yearx_bs[1],
                              dataNames[2] => yearx_bs[2], dataNames[3] => yearx_bs[3],dataNames[4] => yearx_bs[4],
                              dataNames[5] => yearx_bs[5],dataNames[6] => yearx_bs[6], dataNames[7] => yearx_bs[7],
                              dataNames[8] => yearx_bs[8], dataNames[9] => yearx_bs[9],dataNames[10] => yearx_bs[10],
                              dataNames[11] => yearx_bs[11],dataNames[12] => yearx_bs[12], dataNames[13] => yearx_bs[13],
                              dataNames[14] => yearx_bs[14], dataNames[15] => yearx_bs[15],dataNames[16] => yearx_bs[16],
                              dataNames[17] => yearx_bs[17],dataNames[18] => yearx_bs[18], dataNames[19] => yearx_bs[19],
                              dataNames[20] => yearx_bs[20], dataNames[21] => yearx_bs[21],dataNames[22] => yearx_bs[22],
                              dataNames[23] => yearx_bs[23],dataNames[24] => yearx_bs[24], dataNames[25] => yearx_bs[25],
                              dataNames[26] => yearx_bs[26], dataNames[27] => yearx_bs[27],dataNames[28] => yearx_bs[28],
                              dataNames[29] => yearx_bs[29],dataNames[30] => yearx_bs[31], dataNames[31] => yearx_bs[31],
                              dataNames[32] => yearx_bs[32], dataNames[33] => yearx_bs[33],dataNames[34] => yearx_bs[34],
                              dataNames[35] => yearx_bs[35],dataNames[36] => yearx_bs[36], dataNames[37] => yearx_bs[37],
                              dataNames[38] => yearx_bs[38], dataNames[39] => yearx_bs[39],dataNames[40] => yearx_bs[40],
                              dataNames[41] => yearx_bs[41],dataNames[42] => yearx_bs[42], dataNames[43] => yearx_bs[43],
                              dataNames[44] => yearx_bs[44], dataNames[45] => yearx_bs[45],dataNames[46] => yearx_bs[46],
                              dataNames[47] => yearx_bs[47],dataNames[48] => yearx_bs[48], dataNames[49] => yearx_bs[49],
                              dataNames[50] => yearx_bs[50], dataNames[51] => yearx_bs[51],dataNames[52] => yearx_bs[52],
                              dataNames[53] => yearx_bs[53])
      yearxData.save

      quarter += 1
      if quarter==5 
	quarter = 1
	year += 1
      end
      column_set += 1
    }
    
    
    ## ---------- Populate CashFlow table ----------
    # ---------- Parse Annual CashFlow Statement and save data --------
    @tabl = @page.css('table-us_table_ty1')[5]
    @data = @tabl.css('tr').css('td')
  
    dataNames = [:cashFlowsFromOperatingActivities, :netIncomeForTheYear, :continuingIncomeAndLossBeforeIncomeTaxes, :additionOfExpensesOfNonCashTransactions, :retirementBenefits,
                 :employeeBenefits, :compensationExpensesAssociatedWithStockOptions, :expensesOfAllowanceForDoubtfulAccounts, :depreciation, :amortizationOfIntangibleAssets,
                 :contributionsToEstimatedLiabilities, :foreignExchangeLosses, :otherAmortizationExpense, :financeCosts, :interestExpense,
                 :dividendsPaid, :lossOnDisposalOfTradeReceivables, :lossOnDispositionOfFinancialAssets, :lossOnValuationOfFinancialAssets, :impairmentLossesOnFinancialAssets,
                 :lossRelatedToRiskHedgingAccountingDerivatives, :lossInFinancialLiabilities, :lossOnRedemptionOfDebentures, :lossOnInventoryObsolescence, :lossOnInventoryDisposed,
                 :lossOnDisposalOfAssets, :lossOnValuationOfInvestments, :lossOnAssetsRevaluations, :impairmentLossesOnAssets, :lossInEquityMethod,
                 :lossInSubsidiaries, :lossInAssociates, :incomeTaxExpense, :otherExpense, :deductionOfRevenuesOfNonCashTransactions,
                 :foreignExchangeGains, :reversalOfAllowanceForDoubtfulAccounts, :financialIncome, :interestIncome, :dividendIncome,
                 :gainOnDispositionOfTradeReceivables, :gainOnDispositionOfFinancialAssets, :gainOnValuationOfFinancialAssets, :recoveryOfImpairmentLossesOnFinancialAssets,
                 :gainRelatedToRiskHedgingAccountingDerivatives, :gainInFinancialLiabilities, :lossOnRedemptionOfDebentures, :recoveryOfReserveForRetirementAndSeveranceBenefits, :recoveryOfProvisions,
                 :reversalOfCompensationExpensesAssociatedWithStockOptions, :recoveryOnLossOnInventoryObsolescence, :gainOnInventoryDisposed,
                 :gainOnDisposalOfAssets, :gainOnValuationOfInvestments, :gainOnAssetsRevaluations, :impairmentGainsOnAssets, :gainInEquityMethod,
                 :gainInSubsidiaries, :gainInAssociates, :incomeTaxRevenues, :otherIncome, :changesInAssetsAndLiabilitiesFromOperatingActivities,
                 :decreaseInAssets, :increaseInLiabilities, :changeInGovernmentGrants, :changeInOtherWorkingCapital, :cashFlowsFromBusiness,
                 :cashFlowsFromOtherOperatingActivities, :interestReceived, :interestPaid, :dividendsReceived, :dividendsPaid,
                 :refundsOfIncomeTaxes, :paymentsOfIncomeTaxes, :cashFlowsFromDiscontinuedOperating, :cashFlowsFromInvestingActivities, :cashInflowsFromInvestingActivities,
                 :decreaseInCurrentFinancialAssets, :decreaseInLongTermFinancialAssets, :decreaseInAvailableForSaleFinancialAssets, :decreaseInHeldToMaturityInvestments, :decreaseInLongTermLoans,
                 :changeInDerivatives, :decreaseInOtherCurrentFinancialAssets, :decreaseInInvestmentsInAssociates, :decreaseInPropertyPlantAndEquipment, :decreaseInIntangibleAssets, :decreaseInBiologicalAssets,
                 :decreaseInInvestmentInProperties, :cashInflowsFromOtherInvestingActivities,
                 :cashOutflowsFromInvestingActivities, :increaseInCurrentFinancialAssets, :increaseInLongTermFinancialAssets, :increaseInAvailableForSaleFinancialAssets, :increaseInHeldMaturityInvestments, :increaseInLongTermLoans,
                 :changeInDerivatives, :increaseInOtherCurrentFinancialAssets, :increaseInInvestmentsInAssociates, :increaseInPropertyPlantAndEquipment, :increaseInIntangibleAssets, :increaseInBiologicalAssets,
                 :increaseInInvestmentInProperties, :cashOutflowsFromOtherInvestingActivities, :cashFlowsFromOtherInvestingActivities, :interestReceived_investing, :interestPaid_investing, :dividendsReceived_investing,
                 :dividendsPaid_investing, :refundsOfIncomeTaxes_investing, :paymentsOfIncomeTaxes_investing, :cashFlowsFromDiscontinuedOperating_investing,
                 :cashFlowsFromFinancingActivities, :cashInflowsFromFinancingActivities, :increaseInBonds, :increaseInBorrowings, :increaseInOtherPayables, :increaseInCurrentPortionOfLongTermDebts, :increaseInOtherFinancialLiabilities,
                 :increaseInOtherLiabilities, :paidInCapitalIncrease, :saleOfTreasuryStock, :exerciseOfStockOptions, :increaseInCapitalStructureItem, :cashInflowsFromOtherFinancingActivities,
                 :cashOutflowsFromFinancingActivities, :repaymentsOfBonds, :decreaseInBorrowings, :decreaseInOtherPayables, :decreaseInCurrentPortionOfLongTermDebts, :decreaseInOtherFinancialLiabilities,
                 :decreaseInOtherLiabilities, :paidInCapitalDecrease, :purchaseOfTreasuryStock, :decreaseInCapitalStructureItem, :cashOutflowsFromOtherFinancingActivities, :cashFlowsFromOtherFinancingActivities,
                 :interestReceived_financing, :interestPaid_financing, :dividendsReceived_financing, :dividendsPaid_financing, :refundsOfIncomeTaxes_financing, :paymentsOfIncomeTaxes_financing, :cashFlowsFromDiscontinuedOperating_financing,
                 :otherCashFlowsFromOperating_Investing_FinancingActivities, :changeOfConsolidatedScope, :differenceByChangesInForeignExchangeRates, :increaseInCashAndCashEquivalents, :cashAndCashEquivalentsAtTheBeginningOfYear,
                 :cashAndCashEquivalentsAtTheEndOfYear]
  
    column_set = 0
    column_count = 0
    year = 2014
    quarter = 0
  
  
    4.times {
      yearx_bs = Array.new
  
      @data.each do |i|
        if column_set == column_count
          tabl_data = i.text.strip.gsub(/[\s,]/ ,"")
          yearx_bs.push(tabl_data)
          column_count += 1
        else
          column_count += 1
        end
  
        if column_count == 4
          column_count=0
        end
      end
  
      yearxData = Cash.new(stock_id: stockxData.id, year: year, quarter: quarter, dataNames[0] => yearx_bs[0], dataNames[1] => yearx_bs[1],
                              dataNames[2] => yearx_bs[2], dataNames[3] => yearx_bs[3],dataNames[4] => yearx_bs[4],
                              dataNames[5] => yearx_bs[5],dataNames[6] => yearx_bs[6], dataNames[7] => yearx_bs[7],
                              dataNames[8] => yearx_bs[8], dataNames[9] => yearx_bs[9],dataNames[10] => yearx_bs[10],
                              dataNames[11] => yearx_bs[11],dataNames[12] => yearx_bs[12], dataNames[13] => yearx_bs[13],
                              dataNames[14] => yearx_bs[14], dataNames[15] => yearx_bs[15],dataNames[16] => yearx_bs[16],
                              dataNames[17] => yearx_bs[17],dataNames[18] => yearx_bs[18], dataNames[19] => yearx_bs[19],
                              dataNames[20] => yearx_bs[20], dataNames[21] => yearx_bs[21],dataNames[22] => yearx_bs[22],
                              dataNames[23] => yearx_bs[23],dataNames[24] => yearx_bs[24], dataNames[25] => yearx_bs[25],
                              dataNames[26] => yearx_bs[26], dataNames[27] => yearx_bs[27],dataNames[28] => yearx_bs[28],
                              dataNames[29] => yearx_bs[29],dataNames[30] => yearx_bs[30], dataNames[31] => yearx_bs[31],
                              dataNames[32] => yearx_bs[32], dataNames[33] => yearx_bs[33],dataNames[34] => yearx_bs[34],
                              dataNames[35] => yearx_bs[35],dataNames[36] => yearx_bs[36], dataNames[37] => yearx_bs[37],
                              dataNames[38] => yearx_bs[38], dataNames[39] => yearx_bs[39],dataNames[40] => yearx_bs[40],
                              dataNames[41] => yearx_bs[41],dataNames[42] => yearx_bs[42], dataNames[43] => yearx_bs[43],
                              dataNames[44] => yearx_bs[44], dataNames[45] => yearx_bs[45],dataNames[46] => yearx_bs[46],
                              dataNames[47] => yearx_bs[47],dataNames[48] => yearx_bs[48], dataNames[49] => yearx_bs[49],
                              dataNames[50] => yearx_bs[50], dataNames[51] => yearx_bs[51],dataNames[52] => yearx_bs[52],
                              dataNames[53] => yearx_bs[53], dataNames[54] => yearx_bs[54], dataNames[55] => yearx_bs[55],
                              dataNames[56] => yearx_bs[56],dataNames[57] => yearx_bs[57], dataNames[58] => yearx_bs[58],
                              dataNames[59] => yearx_bs[59], dataNames[60] => yearx_bs[60],dataNames[61] => yearx_bs[61],
                              dataNames[62] => yearx_bs[62],dataNames[63] => yearx_bs[63], dataNames[64] => yearx_bs[64],
                              dataNames[65] => yearx_bs[65], dataNames[66] => yearx_bs[66],dataNames[67] => yearx_bs[67],
                              dataNames[68] => yearx_bs[68],dataNames[69] => yearx_bs[69], dataNames[70] => yearx_bs[70],
                              dataNames[71] => yearx_bs[71], dataNames[72] => yearx_bs[72],dataNames[73] => yearx_bs[73],
                              dataNames[74] => yearx_bs[74], dataNames[75] => yearx_bs[75], dataNames[76] => yearx_bs[76],
                              dataNames[77] => yearx_bs[77],dataNames[78] => yearx_bs[78], dataNames[79] => yearx_bs[79],
                              dataNames[80] => yearx_bs[80], dataNames[81] => yearx_bs[81],dataNames[82] => yearx_bs[82],
                              dataNames[83] => yearx_bs[83],dataNames[84] => yearx_bs[84], dataNames[85] => yearx_bs[85],
                              dataNames[86] => yearx_bs[86], dataNames[87] => yearx_bs[87],dataNames[88] => yearx_bs[88],
                              dataNames[89] => yearx_bs[89],dataNames[90] => yearx_bs[90], dataNames[91] => yearx_bs[91],
                              dataNames[92] => yearx_bs[92], dataNames[93] => yearx_bs[93],dataNames[94] => yearx_bs[94],
                              dataNames[95] => yearx_bs[95], dataNames[96] => yearx_bs[96], dataNames[97] => yearx_bs[97],
                              dataNames[98] => yearx_bs[98],dataNames[99] => yearx_bs[99], dataNames[100] => yearx_bs[100],
                              dataNames[101] => yearx_bs[101], dataNames[102] => yearx_bs[102],dataNames[103] => yearx_bs[103],
                              dataNames[104] => yearx_bs[104],dataNames[105] => yearx_bs[105], dataNames[106] => yearx_bs[106],
                              dataNames[107] => yearx_bs[107], dataNames[108] => yearx_bs[108],
                              dataNames[109] => yearx_bs[109],dataNames[110] => yearx_bs[110], dataNames[111] => yearx_bs[111],
                              dataNames[112] => yearx_bs[112], dataNames[113] => yearx_bs[113],dataNames[114] => yearx_bs[114],
                              dataNames[115] => yearx_bs[115], dataNames[116] => yearx_bs[116], dataNames[117] => yearx_bs[117],
                              dataNames[118] => yearx_bs[118],dataNames[119] => yearx_bs[119], dataNames[120] => yearx_bs[120],
                              dataNames[121] => yearx_bs[121], dataNames[122] => yearx_bs[122],dataNames[123] => yearx_bs[123],
                              dataNames[124] => yearx_bs[124],dataNames[125] => yearx_bs[125], dataNames[126] => yearx_bs[126],
                              dataNames[127] => yearx_bs[127], dataNames[128] => yearx_bs[128],dataNames[129] => yearx_bs[129],
                              dataNames[130] => yearx_bs[130],dataNames[131] => yearx_bs[131], dataNames[132] => yearx_bs[132],
                              dataNames[133] => yearx_bs[133], dataNames[134] => yearx_bs[134],dataNames[135] => yearx_bs[135],
                              dataNames[136] => yearx_bs[136], dataNames[137] => yearx_bs[137], dataNames[138] => yearx_bs[138],
                              dataNames[139] => yearx_bs[139],dataNames[140] => yearx_bs[140], dataNames[141] => yearx_bs[141],
                              dataNames[142] => yearx_bs[142], dataNames[143] => yearx_bs[143], dataNames[144] => yearx_bs[144],
                              dataNames[145] => yearx_bs[145], dataNames[146] => yearx_bs[146], dataNames[147] => yearx_bs[147],
                              dataNames[148] => yearx_bs[148], dataNames[149] => yearx_bs[149])
      yearxData.save
  
      year += 1
      column_set += 1
    }
  
  
    # ---------- Parse Quarterly Cash Flow Statement and save data ----------
    @tabl = @page.css('table.us_table_ty1')[6]
    @data = @tabl.css('tr').css('td')
    
    column_set = 0
    column_count = 0
    year = 2016
    quarter = 1
    
    4.times {
      yearx_bs = Array.new
    
      @data.each do |i|
        if column_set == column_count
          tabl_data = i.text.strip.gsub(/[\s,]/ ,"")
          yearx_bs.push(tabl_data)
          column_count += 1
        else
          column_count += 1
        end
    
        if column_count == 4
          column_count=0
        end
      end
    
      yearxData = Cash.new(stock_id: stockxData.id, year: year, quarter: quarter, dataNames[0] => yearx_bs[0], dataNames[1] => yearx_bs[1],
                              dataNames[2] => yearx_bs[2], dataNames[3] => yearx_bs[3],dataNames[4] => yearx_bs[4],
                              dataNames[5] => yearx_bs[5],dataNames[6] => yearx_bs[6], dataNames[7] => yearx_bs[7],
                              dataNames[8] => yearx_bs[8], dataNames[9] => yearx_bs[9],dataNames[10] => yearx_bs[10],
                              dataNames[11] => yearx_bs[11],dataNames[12] => yearx_bs[12], dataNames[13] => yearx_bs[13],
                              dataNames[14] => yearx_bs[14], dataNames[15] => yearx_bs[15],dataNames[16] => yearx_bs[16],
                              dataNames[17] => yearx_bs[17],dataNames[18] => yearx_bs[18], dataNames[19] => yearx_bs[19],
                              dataNames[20] => yearx_bs[20], dataNames[21] => yearx_bs[21],dataNames[22] => yearx_bs[22],
                              dataNames[23] => yearx_bs[23],dataNames[24] => yearx_bs[24], dataNames[25] => yearx_bs[25],
                              dataNames[26] => yearx_bs[26], dataNames[27] => yearx_bs[27],dataNames[28] => yearx_bs[28],
                              dataNames[29] => yearx_bs[29],dataNames[30] => yearx_bs[30], dataNames[31] => yearx_bs[31],
                              dataNames[32] => yearx_bs[32], dataNames[33] => yearx_bs[33],dataNames[34] => yearx_bs[34],
                              dataNames[35] => yearx_bs[35],dataNames[36] => yearx_bs[36], dataNames[37] => yearx_bs[37],
                              dataNames[38] => yearx_bs[38], dataNames[39] => yearx_bs[39],dataNames[40] => yearx_bs[40],
                              dataNames[41] => yearx_bs[41],dataNames[42] => yearx_bs[42], dataNames[43] => yearx_bs[43],
                              dataNames[44] => yearx_bs[44], dataNames[45] => yearx_bs[45],dataNames[46] => yearx_bs[46],
                              dataNames[47] => yearx_bs[47],dataNames[48] => yearx_bs[48], dataNames[49] => yearx_bs[49],
                              dataNames[50] => yearx_bs[50], dataNames[51] => yearx_bs[51],dataNames[52] => yearx_bs[52],
                              dataNames[53] => yearx_bs[53], dataNames[54] => yearx_bs[54], dataNames[55] => yearx_bs[55],
                              dataNames[56] => yearx_bs[56],dataNames[57] => yearx_bs[57], dataNames[58] => yearx_bs[58],
                              dataNames[59] => yearx_bs[59], dataNames[60] => yearx_bs[60],dataNames[61] => yearx_bs[61],
                              dataNames[62] => yearx_bs[62],dataNames[63] => yearx_bs[63], dataNames[64] => yearx_bs[64],
                              dataNames[65] => yearx_bs[65], dataNames[66] => yearx_bs[66],dataNames[67] => yearx_bs[67],
                              dataNames[68] => yearx_bs[68],dataNames[69] => yearx_bs[69], dataNames[70] => yearx_bs[70],
                              dataNames[71] => yearx_bs[71], dataNames[72] => yearx_bs[72],dataNames[73] => yearx_bs[73],
                              dataNames[74] => yearx_bs[74], dataNames[75] => yearx_bs[75], dataNames[76] => yearx_bs[76],
                              dataNames[77] => yearx_bs[77],dataNames[78] => yearx_bs[78], dataNames[79] => yearx_bs[79],
                              dataNames[80] => yearx_bs[80], dataNames[81] => yearx_bs[81],dataNames[82] => yearx_bs[82],
                              dataNames[83] => yearx_bs[83],dataNames[84] => yearx_bs[84], dataNames[85] => yearx_bs[85],
                              dataNames[86] => yearx_bs[86], dataNames[87] => yearx_bs[87],dataNames[88] => yearx_bs[88],
                              dataNames[89] => yearx_bs[89],dataNames[90] => yearx_bs[90], dataNames[91] => yearx_bs[91],
                              dataNames[92] => yearx_bs[92], dataNames[93] => yearx_bs[93],dataNames[94] => yearx_bs[94],
                              dataNames[95] => yearx_bs[95], dataNames[96] => yearx_bs[96], dataNames[97] => yearx_bs[97],
                              dataNames[98] => yearx_bs[98],dataNames[99] => yearx_bs[99], dataNames[100] => yearx_bs[100],
                              dataNames[101] => yearx_bs[101], dataNames[102] => yearx_bs[102],dataNames[103] => yearx_bs[103],
                              dataNames[104] => yearx_bs[104],dataNames[105] => yearx_bs[105], dataNames[106] => yearx_bs[106],
                              dataNames[107] => yearx_bs[107], dataNames[108] => yearx_bs[108],
                              dataNames[109] => yearx_bs[109],dataNames[110] => yearx_bs[110], dataNames[111] => yearx_bs[111],
                              dataNames[112] => yearx_bs[112], dataNames[113] => yearx_bs[113],dataNames[114] => yearx_bs[114],
                              dataNames[115] => yearx_bs[115], dataNames[116] => yearx_bs[116], dataNames[117] => yearx_bs[117],
                              dataNames[118] => yearx_bs[118],dataNames[119] => yearx_bs[119], dataNames[120] => yearx_bs[120],
                              dataNames[121] => yearx_bs[121], dataNames[122] => yearx_bs[122],dataNames[123] => yearx_bs[123],
                              dataNames[124] => yearx_bs[124],dataNames[125] => yearx_bs[125], dataNames[126] => yearx_bs[126],
                              dataNames[127] => yearx_bs[127], dataNames[128] => yearx_bs[128],dataNames[129] => yearx_bs[129],
                              dataNames[130] => yearx_bs[130],dataNames[131] => yearx_bs[131], dataNames[132] => yearx_bs[132],
                              dataNames[133] => yearx_bs[133], dataNames[134] => yearx_bs[134],dataNames[135] => yearx_bs[135],
                              dataNames[136] => yearx_bs[136], dataNames[137] => yearx_bs[137], dataNames[138] => yearx_bs[138],
                              dataNames[139] => yearx_bs[139],dataNames[140] => yearx_bs[140], dataNames[141] => yearx_bs[141],
                              dataNames[142] => yearx_bs[142], dataNames[143] => yearx_bs[143], dataNames[144] => yearx_bs[144],
                              dataNames[145] => yearx_bs[145], dataNames[146] => yearx_bs[146], dataNames[147] => yearx_bs[147],
                              dataNames[148] => yearx_bs[148], dataNames[149] => yearx_bs[149])
      yearxData.save
    
      quarter += 1
      if quarter==5 
	quarter = 1
	year += 1
      end
      column_set += 1
    }
    
  end
  
  
end

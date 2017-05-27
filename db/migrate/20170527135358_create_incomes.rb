class CreateIncomes < ActiveRecord::Migration[5.1]
  def change
    create_table :incomes do |t|

      #해당 분기/년도 정보
      t.integer   :year
      t.integer   :quarter
      t.integer   :stock_id
      
      t.integer   :revenue       #매출액
      t.integer   :costOfGoodsSold    #매출원가
      t.integer   :grossProfit      #매출총이익
      t.integer   :sellAdminExpense     #판매비와관리비
      t.integer   :employeeSalary       #인건비
      t.integer   :depreciation_amortization    #유무형자산상각비
      t.integer   :r_and_d_expense    #연구개발비
      t.integer   :marketingExpense   #광고선전비
      t.integer   :sellingExpense     #판매비 
      t.integer   :maintenanceExpense   #관리비
      t.integer   :otherCostExpense    #기타원가성비용
      t.integer   :otherSellingExpense  #기타
      
      t.integer   :operatingIncome    #영업이익
      t.integer   :financingProfit    #금융수익
      t.integer   :interestIncome     #이자수익
      t.integer   :dividendIncome     #배당금수익
      t.integer   :currencyExchangeGains    #외환이익
      t.integer   :allowanceForBadDebts   #대손충당금환입액
      t.integer   :accountsReceivable   #매출채권처분이익
      t.integer   :gainOnSaleOfFinancialAsset #금융자산처분이익
      t.integer   :gainOnValuationOfFinancialAssets #금융자산 평가이익
      t.integer   :recoveryOfImpairmentOnFinancialAssets  #금융자산손상차손환입
      t.integer   :gainOnDerivatives  #파생상품이익
      t.integer   :otherFinancialIncome   #기타금융수익
      
      t.integer   :financingExpense     #금융원가
      t.integer   :interestExpense      #이자비용
      t.integer   :currencyExchangeLoss   #외환손실
      t.integer   :expensesOfAllowanceForDoubtfulAccounts #대손상각비
      t.integer   :accountsReceivableLoss #매출채권처분손실
      t.integer   :lossOnSaleOfFinancialAsset #금융자산처분손실
      t.integer   :lossOnValuationOfFinancialAsset  #금융자산평가손실
      t.integer   :impairmentLossOnFinancialAsset #금융자산손상차손
      t.integer   :lossOnDerivatives  #파생상품손실
      t.integer   :otherFinancialExpense  #기타금융원가
      
      t.integer   :otherProfit    #기타수익
      t.integer   :otherInterestIncome  #이자수익
      t.integer   :otherDividendIncome  #배당금수익
      t.integer   :otherCurrencyExchangeGain  #외환이익
      t.integer   :gainOnInventory    #재고자산감모손실환입
      t.integer   :gainOnSaleOfInventory  #재고자산폐기(처분)이익
      t.integer   :gainOnSaleOfAsset    #자산처분(폐기)이익
      t.integer   :gainOnValuationOfAsset #자산평가이익
      t.integer   :gainOnImpairmentLoss #자산손상차손환입
      t.integer   :otherGainOnDerivative  #파생상품이익
      t.integer   :rentalIncome   #임대료수익
      t.integer   :royaltyIncome  #로열티수익
      t.integer   :commissionIncome #수수료수익
      t.integer   :gainOnAllowanceForDoubtfulAccount  #대손충당금환입
      t.integer   :gainOnProvision    #충당부채환입액
      t.integer   :otherOtherIncome   #기타
      
      t.integer   :otherExpense   #기타비용
      t.integer   :otherInterestExpense #이자비용
      t.integer   :otherCurrencyExchangeLoss  #외환손실
      t.integer   :lossOnInventory    #재고자산감모손실
      t.integer   :lossOnSaleOfInventory  #재고자산폐기(처분)손실
      t.integer   :lossOnSaleOfAsset    #자산처분(폐기)손실
      t.integer   :lossOnValuationOfAsset #자산평가손실
      t.integer   :otherImpairmentLoss  #자산손상차손
      t.integer   :otherLossOnDerivative  #파생상품손실
      t.integer   :otherExpenseOfAllowanceForDoubtfulAccounts #기타대손상각비
      t.integer   :lossOnProvision  #충당부채전입액
      t.integer   :otherOtherExpense  #기타
      
      t.integer   :profitFromOccupancy  #종속기업,공동지배기업및관계기업관련손익
      t.integer   :gainInEquityMethod   #지분법손익
      t.integer   :saleOfSecuritiesGain #종속기업, 공동지배기업및 관계기업 투자주식 처분손익
      t.integer   :securityImpairmentLoss #종속기업, 공동지배기업및 관계기업투자주식 손상관련 손익
      t.integer   :occupancyOther
      
      t.integer   :ebit   #세전계속사업이익
      t.integer   :incomeTaxExpense   #법인세비용
      t.integer   :ongoingOperatingIncome   #계속영업이익
      t.integer   :discontinuedOperatingIncome  #중단영업이익
      t.integer   :netIncome  #당기순이익
      t.integer   :netIncomeOwnersOfParentEquity  #지배주주순이익
      t.integer   :netIncomeNonControllingInterestEquity  #비지배주주순이익
      
      t.timestamps null: false
    end
  end
end

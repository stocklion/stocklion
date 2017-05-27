class CreateCashes < ActiveRecord::Migration[5.1]
  def change
    create_table :cashes do |t|
      
      t.integer  :year
      t.integer  :quarter
      t.integer  :stock_id

      t.integer  :cashFlowsFromOperatingActivities    #영업활동으로인한현금흐름
      t.integer  :netIncomeForTheYear    #당기순손익
      t.integer  :continuingIncomeAndLossBeforeIncomeTaxes    #법인세비용차감전계속사업이익
      t.integer  :additionOfExpensesOfNonCashTransactions    #현금유출이없는비용등가산
      t.integer  :retirementBenefits     #퇴직급여
      t.integer  :employeeBenefits     #종업원급여
      t.integer  :compensationExpensesAssociatedWithStockOptions     #주식보상비
      t.integer  :expensesOfAllowanceForDoubtfulAccounts     #대손상각비
      t.integer  :depreciation     #감가상각비
      t.integer  :amortizationOfIntangibleAssets     #무형자산상각비
      t.integer  :contributionsToEstimatedLiabilities      #충당부채전입액
      t.integer  :foreignExchangeLosses     #외환손실
      t.integer  :otherAmortizationExpense     #기타의대손상각비
      t.integer  :financeCosts      #금융원가
      t.integer  :interestExpense     #이자비용
      t.integer  :dividendsPaid      #배당금지급
      t.integer  :lossOnDisposalOfTradeReceivables    #매출채권처분손실
      t.integer  :lossOnDispositionOfFinancialAssets    #금융자산처분손실
      t.integer  :lossOnValuationOfFinancialAssets    #금융자산평가손실
      t.integer  :impairmentLossesOnFinancialAssets     #금융자산손상차손
      t.integer  :lossRelatedToRiskHedgingAccountingDerivatives    #파생상품손실
      t.integer  :lossInFinancialLiabilities     #금융부채관련손실
      t.integer  :lossOnRedemptionOfDebentures    #사채상환손실
      t.integer  :lossOnInventoryObsolescence     #재고자산감모손실
      t.integer  :lossOnInventoryDisposed    #재고자산폐기(처분)손실
      t.integer  :lossOnDisposalOfAssets    #자산처분(폐기)손실
      t.integer  :lossOnValuationOfInvestments    #투자자산평가손실
      t.integer  :lossOnAssetsRevaluations     #자산재평가손실
      t.integer  :impairmentLossesOnAssets    #자산손상차손
      t.integer  :lossInEquityMethod     #지분법관련손실
      t.integer  :lossInSubsidiaries    #종속기업관련손실
      t.integer  :lossInAssociates    #관계기업관련손익
      t.integer  :incomeTaxExpense    #법인세비용
      t.integer  :otherExpense    #기타비용

      t.integer  :deductionOfRevenuesOfNonCashTransactions   #현금유입이없는수익등차감
      t.integer  :foreignExchangeGains     #외환이익
      t.integer  :reversalOfAllowanceForDoubtfulAccounts     #대손충당금환입액
      t.integer  :financialIncome     #금융수익
      t.integer  :interestIncome    #이자수익
      t.integer  :dividendIncome    #배당금수익
      t.integer  :gainOnDispositionOfTradeReceivables    #매출채권처분이익
      t.integer  :gainOnDispositionOfFinancialAssets    #금융자산처분이익
      t.integer  :gainOnValuationOfFinancialAssets    #금융자산평가이익
      t.integer  :recoveryOfImpairmentLossesOnFinancialAssets    #금융자산손상차손환입
      t.integer  :gainRelatedToRiskHedgingAccountingDerivatives   #파생상품이익
      t.integer  :gainInFinancialLiabilities   #금융부채관련이익
      t.integer  :lossOnRedemptionOfDebentures   #사채상환이익
      t.integer  :recoveryOfReserveForRetirementAndSeveranceBenefits  #퇴직급여충당부채환입액
      t.integer  :recoveryOfProvisions   #충당부채환입액
      t.integer  :reversalOfCompensationExpensesAssociatedWithStockOptions  #주식보상비환입
      t.integer  :recoveryOnLossOnInventoryObsolescence   #재고자산감모손실환입
      t.integer  :gainOnInventoryDisposed    #재고자산폐기(처분)이익
      t.integer  :gainOnDisposalOfAssets     #자산처분(폐기)이익
      t.integer  :gainOnValuationOfInvestments    #투자자산평가이익
      t.integer  :gainOnAssetsRevaluations    #자산재평가이익
      t.integer  :impairmentGainsOnAssets    #자산손상차손환입
      t.integer  :gainInEquityMethod     #지분법관련이익
      t.integer  :gainInSubsidiaries     #종속회사관련이익
      t.integer  :gainInAssociates    #관계기업관련손익
      t.integer  :incomeTaxRevenues   #법인세수익
      t.integer  :otherIncome   #기타수익

      t.integer  :changesInAssetsAndLiabilitiesFromOperatingActivities    #영업활동으로인한자산부채변동(운전자본변동)
      t.integer  :decreaseInAssets    #자산의감소
      t.integer  :increaseInLiabilities    #부채의증가
      t.integer  :changeInGovernmentGrants    #정부보조금등의변동
      t.integer  :changeInOtherWorkingCapital     #기타운전자본의변동
      t.integer  :cashFlowsFromBusiness     #영업에서창출된현금흐름

      t.integer  :cashFlowsFromOtherOperatingActivities     #기타영업활동으로인한현금흐름
      t.integer  :interestReceived   #이자수입
      t.integer  :interestPaid   #이자지급
      t.integer  :dividendsReceived   #배당금수입
      t.integer  :dividendsPaid    #배당금지급
      t.integer  :refundsOfIncomeTaxes    #법인세환입
      t.integer  :paymentsOfIncomeTaxes    #법인세납부
      t.integer  :cashFlowsFromDiscontinuedOperating    #중단영업관련현금흐름

      t.integer  :cashFlowsFromInvestingActivities    #투자활동으로인한현금흐름
      t.integer  :cashInflowsFromInvestingActivities    #투자활동으로인한현금유입액
      t.integer  :decreaseInCurrentFinancialAssets    #유동금융자산의감소
      t.integer  :decreaseInLongTermFinancialAssets    #장기금융상품의감소
      t.integer  :decreaseInAvailableForSaleFinancialAssets    #매도가능금융자산의감소
      t.integer  :decreaseInHeldToMaturityInvestments     #만기보유금융자산의감소
      t.integer  :decreaseInLongTermLoans    #장기대여금의감소
      t.integer  :changeInDerivatives    #파생상품의변동
      t.integer  :decreaseInOtherCurrentFinancialAssets    #기타비유동금융자산의감소
      t.integer  :decreaseInInvestmentsInAssociates    #관계기업등지분관련투자자산의감소
      t.integer  :decreaseInPropertyPlantAndEquipment    #유형자산의감소
      t.integer  :decreaseInIntangibleAssets    #무형자산의감소
      t.integer  :decreaseInBiologicalAssets    #생물자산의감소
      t.integer  :decreaseInInvestmentInProperties    #투자부동산의감소
      t.integer  :cashInflowsFromOtherInvestingActivities    #기타투자활동으로인한현금유입액

      t.integer  :cashOutflowsFromInvestingActivities     #투자활동으로인한현금유출액
      t.integer  :increaseInCurrentFinancialAssets     #유동금융자산의증가
      t.integer  :increaseInLongTermFinancialAssets    #장기금융상품의증가
      t.integer  :increaseInAvailableForSaleFinancialAssets     #매도가능금융자산의증가
      t.integer  :increaseInHeldMaturityInvestments     #만기보유금융자산의증가
      t.integer  :increaseInLongTermLoans     #장기대여금의증가
      t.integer  :changeInDerivatives    #파생상품의변동
      t.integer  :increaseInOtherCurrentFinancialAssets     #기타비유동금융자산의증가
      t.integer  :increaseInInvestmentsInAssociates    #관계기업등지분관련투자자산의증가
      t.integer  :increaseInPropertyPlantAndEquipment     #유형자산의증가
      t.integer  :increaseInIntangibleAssets     #무형자산의증가
      t.integer  :increaseInBiologicalAssets     #생물자산의증가
      t.integer  :increaseInInvestmentInProperties     #투자부동산의증가
      t.integer  :cashOutflowsFromOtherInvestingActivities     #기타투자활동으로인한현금유출액

      t.integer  :cashFlowsFromOtherInvestingActivities    #기타투자활동으로인한현금흐름
      t.integer  :interestReceived_investing    #이자수입
      t.integer  :interestPaid_investing     #이자지급
      t.integer  :dividendsReceived_investing     #배당금수입
      t.integer  :dividendsPaid_investing     #배당금지급
      t.integer  :refundsOfIncomeTaxes_investing     #법인세환입
      t.integer  :paymentsOfIncomeTaxes_investing     #법인세납부
      t.integer  :cashFlowsFromDiscontinuedOperating_investing    #중단영업관련현금흐름

      t.integer  :cashFlowsFromFinancingActivities    #재무활동으로인한현금흐름
      t.integer  :cashInflowsFromFinancingActivities    #재무활동으로인한현금유입액
      t.integer  :increaseInBonds     #사채의증가
      t.integer  :increaseInBorrowings    #차입금의증가
      t.integer  :increaseInOtherPayables    #미지급금의증가
      t.integer  :increaseInCurrentPortionOfLongTermDebts    #유동성장기부채의증가
      t.integer  :increaseInOtherFinancialLiabilities     #기타금융부채의증가
      t.integer  :increaseInOtherLiabilities    #기타부채의증가
      t.integer  :paidInCapitalIncrease    #유상증자
      t.integer  :saleOfTreasuryStock     #자기주식의처분
      t.integer  :exerciseOfStockOptions     #주식매입선택권의행가
      t.integer  :increaseInCapitalStructureItem     #자본구성항목의증가
      t.integer  :cashInflowsFromOtherFinancingActivities    #기타재무활동으로인한현금유입액

      t.integer  :cashOutflowsFromFinancingActivities    #재무활동으로인한현금유출액
      t.integer  :repaymentsOfBonds    #사채의감소
      t.integer  :decreaseInBorrowings    #차입금의감소
      t.integer  :decreaseInOtherPayables    #미지급금의감소
      t.integer  :decreaseInCurrentPortionOfLongTermDebts    #유동성장기부채의감소
      t.integer  :decreaseInOtherFinancialLiabilities     #기타금융부채의감소
      t.integer  :decreaseInOtherLiabilities    #기타부채의감소
      t.integer  :paidInCapitalDecrease    #유상감자
      t.integer  :purchaseOfTreasuryStock    #자기주식의취득
      t.integer  :decreaseInCapitalStructureItem    #자본구성항목의감소
      t.integer  :cashOutflowsFromOtherFinancingActivities    #기타재무활동으로인한현금유출액

      t.integer  :cashFlowsFromOtherFinancingActivities    #기타재무활동으로인한현금흐름
      t.integer  :interestReceived_financing   #이자수입
      t.integer  :interestPaid_financing   #이자지급
      t.integer  :dividendsReceived_financing    #배당금수입
      t.integer  :dividendsPaid_financing     #배당금지급
      t.integer  :refundsOfIncomeTaxes_financing    #법인세환입
      t.integer  :paymentsOfIncomeTaxes_financing     #법인세납부
      t.integer  :cashFlowsFromDiscontinuedOperating_financing     #중단영업관련현금흐름

      t.integer  :otherCashFlowsFromOperating_Investing_FinancingActivities    #영업투자재무활동기타현금흐름
      t.integer  :changeOfConsolidatedScope     #연결범위변동으로인한현금의증가
      t.integer  :differenceByChangesInForeignExchangeRates    #환율변동효과
      t.integer  :increaseInCashAndCashEquivalents    #현금및현금성자산의증가
      t.integer  :cashAndCashEquivalentsAtTheBeginningOfYear    #기초현금및현금성자산
      t.integer  :cashAndCashEquivalentsAtTheEndOfYear    #기말현금및현금성자산


      t.timestamps
    end
  end
end

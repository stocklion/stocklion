class CreateIncomes < ActiveRecord::Migration[5.1]
  def change
    create_table :incomes do |t|

      #해당 분기/년도 정보
      t.integer   :year
      t.integer   :quarter
      t.integer   :stock_id

      # flag for abnormal Net Income // 0: no flag // 1: high 자산처분이익 or 자산처분손실 // 2: high 중단영업이익 // 3: both
      t.integer   :flag
      
      t.integer   :revenue                                #매출액 0
      t.integer   :costOfGoodsSold                        #매출원가 1
      t.integer   :grossProfit                            #매출총이익 2
      t.integer   :sellAdminExpense                       #판매비와관리비 3
      t.integer   :employeeSalary                         #인건비 4
      t.integer   :depreciation_amortization              #유무형자산상각비 5
      t.integer   :r_and_d_expense                        #연구개발비 6
      t.integer   :marketingExpense                       #광고선전비 7
      t.integer   :sellingExpense                         #판매비  8
      t.integer   :maintenanceExpense                     #관리비 9
      t.integer   :otherCostExpense                       #기타원가성비용 10
      t.integer   :otherSellingExpense                    #기타 11
      
      t.integer   :operatingIncome                        #영업이익 12
      t.integer   :financingProfit                        #금융수익 13
      t.integer   :interestIncome                         #이자수익 14
      t.integer   :dividendIncome                         #배당금수익 15
      t.integer   :currencyExchangeGains                  #외환이익 16
      t.integer   :allowanceForBadDebts                   #대손충당금환입액 17
      t.integer   :accountsReceivable                     #매출채권처분이익 18
      t.integer   :gainOnSaleOfFinancialAsset             #금융자산처분이익 19
      t.integer   :gainOnValuationOfFinancialAssets       #금융자산 평가이익 20
      t.integer   :recoveryOfImpairmentOnFinancialAssets  #금융자산손상차손환입 21
      t.integer   :gainOnDerivatives                      #파생상품이익 22
      t.integer   :otherFinancialIncome                   #기타금융수익 23
      
      t.integer   :financingExpense                       #금융원가 24
      t.integer   :interestExpense                        #이자비용 25
      t.integer   :currencyExchangeLoss                   #외환손실 26
      t.integer   :expensesOfAllowanceForDoubtfulAccounts #대손상각비 27
      t.integer   :accountsReceivableLoss                 #매출채권처분손실 28
      t.integer   :lossOnSaleOfFinancialAsset             #금융자산처분손실 29
      t.integer   :lossOnValuationOfFinancialAsset        #금융자산평가손실 30
      t.integer   :impairmentLossOnFinancialAsset         #금융자산손상차손 31
      t.integer   :lossOnDerivatives                      #파생상품손실 32
      t.integer   :otherFinancialExpense                  #기타금융원가 33
      
      t.integer   :otherProfit                            #기타수익 34
      t.integer   :otherInterestIncome                    #이자수익 35
      t.integer   :otherDividendIncome                    #배당금수익 36
      t.integer   :otherCurrencyExchangeGain              #외환이익 37
      t.integer   :gainOnInventory                        #재고자산감모손실환입 38
      t.integer   :gainOnSaleOfInventory                  #재고자산폐기(처분)이익 39
      t.integer   :gainOnSaleOfAsset                      #자산처분(폐기)이익 40
      t.integer   :gainOnValuationOfAsset                 #자산평가이익 41
      t.integer   :gainOnImpairmentLoss                   #자산손상차손환입 42
      t.integer   :otherGainOnDerivative                  #파생상품이익 43
      t.integer   :rentalIncome                           #임대료수익 44
      t.integer   :royaltyIncome                          #로열티수익 45
      t.integer   :commissionIncome                       #수수료수익 46
      t.integer   :gainOnAllowanceForDoubtfulAccount      #대손충당금환입 47
      t.integer   :gainOnProvision                        #충당부채환입액 48
      t.integer   :otherOtherIncome                       #기타 49
      
      t.integer   :otherExpense                           #기타비용 50
      t.integer   :otherInterestExpense                   #이자비용 51
      t.integer   :otherCurrencyExchangeLoss              #외환손실 52
      t.integer   :lossOnInventory                        #재고자산감모손실 53
      t.integer   :lossOnSaleOfInventory                  #재고자산폐기(처분)손실 54
      t.integer   :lossOnSaleOfAsset                      #자산처분(폐기)손실 55
      t.integer   :lossOnValuationOfAsset                 #자산평가손실 56
      t.integer   :otherImpairmentLoss                    #자산손상차손 57
      t.integer   :otherLossOnDerivative                  #파생상품손실 58
      t.integer   :otherExpenseOfAllowanceForDoubtfulAccounts #기타대손상각비 59
      t.integer   :lossOnProvision                        #충당부채전입액 60
      t.integer   :otherOtherExpense                      #기타 61
      
      t.integer   :profitFromOccupancy                    #종속기업,공동지배기업및관계기업관련손익 62
      t.integer   :gainInEquityMethod                     #지분법손익 63
      t.integer   :saleOfSecuritiesGain                   #종속기업, 공동지배기업및 관계기업 투자주식 처분손익 64
      t.integer   :securityImpairmentLoss                 #종속기업, 공동지배기업및 관계기업투자주식 손상관련 손익 65
      t.integer   :occupancyOther                         #기타 66
      
      t.integer   :ebit                                   #세전계속사업이익 67
      t.integer   :incomeTaxExpense                       #법인세비용 68
      t.integer   :ongoingOperatingIncome                 #계속영업이익 69
      t.integer   :discontinuedOperatingIncome            #중단영업이익 70
      t.integer   :netIncome                              #당기순이익 71
      t.integer   :netIncomeOwnersOfParentEquity          #지배주주순이익 72
      t.integer   :netIncomeNonControllingInterestEquity  #비지배주주순이익 73
      
      t.timestamps null: false
    end
  end
end

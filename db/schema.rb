# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170625041549) do

  create_table "balances", force: :cascade do |t|
    t.integer "year"
    t.integer "quarter"
    t.integer "stock_id"
    t.integer "assets"
    t.integer "currentAssets"
    t.integer "inventories"
    t.integer "currentBiologicalAssets"
    t.integer "currentFinancialAssets"
    t.integer "accountsRecievables_and_otherCurrentRecievables"
    t.integer "currentTaxAssets"
    t.integer "otherCurrentAssets"
    t.integer "cah_and_cashEquivalents"
    t.integer "assetHeldforSaleorDisposalGroup"
    t.integer "nonCurrentAssets"
    t.integer "pPE"
    t.integer "intangibleAssets"
    t.integer "nonCurrentBiologicalAssets"
    t.integer "investmentPeroperties"
    t.integer "lTFinancialAssets"
    t.integer "InvestmentsAssociates_Subsidiaries_JointVentures"
    t.integer "lTtradeRecievables_and_otherCurrentRecievables"
    t.integer "deferredTaxAssets"
    t.integer "lTcurrentTaxAssets"
    t.integer "otherNonCurrentAssets"
    t.integer "otherFinancialInstitutionsAssets"
    t.integer "liabilities"
    t.integer "currentLiabilities"
    t.integer "sTCorporateBonds"
    t.integer "sTBorrowings"
    t.integer "currentLTliabilites"
    t.integer "currentFinancialLiabilities"
    t.integer "accountsPayable_otherCurrentPayables"
    t.integer "currentProvisionsforEmployeeBenefits"
    t.integer "otherSTProvisions"
    t.integer "currentTaxLiabilities"
    t.integer "otherCurrentLiablities"
    t.integer "assetHeldforSaleorDisposalGroupLiabilities"
    t.integer "nonCurrentLiabilities"
    t.integer "corporateBonds"
    t.integer "lTBorrowings"
    t.integer "nonCurrentFinancialLiabilities"
    t.integer "lTaccountsPayable_otherCurrentPayables"
    t.integer "nonCurrentProvisionsforEmployeeBenefits"
    t.integer "otherLTProvisions"
    t.integer "deferredTaxALiabilities"
    t.integer "lTcurrentTaxLiabilities"
    t.integer "otherNonCurrentLiabilities"
    t.integer "otherFinancialInstitutionsLiabilities"
    t.integer "shareholderEquity"
    t.integer "ownersofParentEquity"
    t.integer "capitalStock"
    t.integer "structuredCapitalSecurities"
    t.integer "capitalSurplus"
    t.integer "otherReserves"
    t.integer "accumulatedOtherComprehensiveIncome"
    t.integer "retainedEarnings"
    t.integer "nonControllingInterestsEquity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cashes", force: :cascade do |t|
    t.integer "year"
    t.integer "quarter"
    t.integer "stock_id"
    t.integer "cashFlowsFromOperatingActivities"
    t.integer "netIncomeForTheYear"
    t.integer "continuingIncomeAndLossBeforeIncomeTaxes"
    t.integer "additionOfExpensesOfNonCashTransactions"
    t.integer "retirementBenefits"
    t.integer "employeeBenefits"
    t.integer "compensationExpensesAssociatedWithStockOptions"
    t.integer "expensesOfAllowanceForDoubtfulAccounts"
    t.integer "depreciation"
    t.integer "amortizationOfIntangibleAssets"
    t.integer "contributionsToEstimatedLiabilities"
    t.integer "foreignExchangeLosses"
    t.integer "otherAmortizationExpense"
    t.integer "financeCosts"
    t.integer "interestExpense"
    t.integer "dividendsPaid"
    t.integer "lossOnDisposalOfTradeReceivables"
    t.integer "lossOnDispositionOfFinancialAssets"
    t.integer "lossOnValuationOfFinancialAssets"
    t.integer "impairmentLossesOnFinancialAssets"
    t.integer "lossRelatedToRiskHedgingAccountingDerivatives"
    t.integer "lossInFinancialLiabilities"
    t.integer "lossOnRedemptionOfDebentures"
    t.integer "lossOnInventoryObsolescence"
    t.integer "lossOnInventoryDisposed"
    t.integer "lossOnDisposalOfAssets"
    t.integer "lossOnValuationOfInvestments"
    t.integer "lossOnAssetsRevaluations"
    t.integer "impairmentLossesOnAssets"
    t.integer "lossInEquityMethod"
    t.integer "lossInSubsidiaries"
    t.integer "lossInAssociates"
    t.integer "incomeTaxExpense"
    t.integer "otherExpense"
    t.integer "deductionOfRevenuesOfNonCashTransactions"
    t.integer "foreignExchangeGains"
    t.integer "reversalOfAllowanceForDoubtfulAccounts"
    t.integer "financialIncome"
    t.integer "interestIncome"
    t.integer "dividendIncome"
    t.integer "gainOnDispositionOfTradeReceivables"
    t.integer "gainOnDispositionOfFinancialAssets"
    t.integer "gainOnValuationOfFinancialAssets"
    t.integer "recoveryOfImpairmentLossesOnFinancialAssets"
    t.integer "gainRelatedToRiskHedgingAccountingDerivatives"
    t.integer "gainInFinancialLiabilities"
    t.integer "recoveryOfReserveForRetirementAndSeveranceBenefits"
    t.integer "recoveryOfProvisions"
    t.integer "reversalOfCompensationExpensesAssociatedWithStockOptions"
    t.integer "recoveryOnLossOnInventoryObsolescence"
    t.integer "gainOnInventoryDisposed"
    t.integer "gainOnDisposalOfAssets"
    t.integer "gainOnValuationOfInvestments"
    t.integer "gainOnAssetsRevaluations"
    t.integer "impairmentGainsOnAssets"
    t.integer "gainInEquityMethod"
    t.integer "gainInSubsidiaries"
    t.integer "gainInAssociates"
    t.integer "incomeTaxRevenues"
    t.integer "otherIncome"
    t.integer "changesInAssetsAndLiabilitiesFromOperatingActivities"
    t.integer "decreaseInAssets"
    t.integer "increaseInLiabilities"
    t.integer "changeInGovernmentGrants"
    t.integer "changeInOtherWorkingCapital"
    t.integer "cashFlowsFromBusiness"
    t.integer "cashFlowsFromOtherOperatingActivities"
    t.integer "interestReceived"
    t.integer "interestPaid"
    t.integer "dividendsReceived"
    t.integer "refundsOfIncomeTaxes"
    t.integer "paymentsOfIncomeTaxes"
    t.integer "cashFlowsFromDiscontinuedOperating"
    t.integer "cashFlowsFromInvestingActivities"
    t.integer "cashInflowsFromInvestingActivities"
    t.integer "decreaseInCurrentFinancialAssets"
    t.integer "decreaseInLongTermFinancialAssets"
    t.integer "decreaseInAvailableForSaleFinancialAssets"
    t.integer "decreaseInHeldToMaturityInvestments"
    t.integer "decreaseInLongTermLoans"
    t.integer "changeInDerivatives"
    t.integer "decreaseInOtherCurrentFinancialAssets"
    t.integer "decreaseInInvestmentsInAssociates"
    t.integer "decreaseInPropertyPlantAndEquipment"
    t.integer "decreaseInIntangibleAssets"
    t.integer "decreaseInBiologicalAssets"
    t.integer "decreaseInInvestmentInProperties"
    t.integer "cashInflowsFromOtherInvestingActivities"
    t.integer "cashOutflowsFromInvestingActivities"
    t.integer "increaseInCurrentFinancialAssets"
    t.integer "increaseInLongTermFinancialAssets"
    t.integer "increaseInAvailableForSaleFinancialAssets"
    t.integer "increaseInHeldMaturityInvestments"
    t.integer "increaseInLongTermLoans"
    t.integer "increaseInOtherCurrentFinancialAssets"
    t.integer "increaseInInvestmentsInAssociates"
    t.integer "increaseInPropertyPlantAndEquipment"
    t.integer "increaseInIntangibleAssets"
    t.integer "increaseInBiologicalAssets"
    t.integer "increaseInInvestmentInProperties"
    t.integer "cashOutflowsFromOtherInvestingActivities"
    t.integer "cashFlowsFromOtherInvestingActivities"
    t.integer "interestReceived_investing"
    t.integer "interestPaid_investing"
    t.integer "dividendsReceived_investing"
    t.integer "dividendsPaid_investing"
    t.integer "refundsOfIncomeTaxes_investing"
    t.integer "paymentsOfIncomeTaxes_investing"
    t.integer "cashFlowsFromDiscontinuedOperating_investing"
    t.integer "cashFlowsFromFinancingActivities"
    t.integer "cashInflowsFromFinancingActivities"
    t.integer "increaseInBonds"
    t.integer "increaseInBorrowings"
    t.integer "increaseInOtherPayables"
    t.integer "increaseInCurrentPortionOfLongTermDebts"
    t.integer "increaseInOtherFinancialLiabilities"
    t.integer "increaseInOtherLiabilities"
    t.integer "paidInCapitalIncrease"
    t.integer "saleOfTreasuryStock"
    t.integer "exerciseOfStockOptions"
    t.integer "increaseInCapitalStructureItem"
    t.integer "cashInflowsFromOtherFinancingActivities"
    t.integer "cashOutflowsFromFinancingActivities"
    t.integer "repaymentsOfBonds"
    t.integer "decreaseInBorrowings"
    t.integer "decreaseInOtherPayables"
    t.integer "decreaseInCurrentPortionOfLongTermDebts"
    t.integer "decreaseInOtherFinancialLiabilities"
    t.integer "decreaseInOtherLiabilities"
    t.integer "paidInCapitalDecrease"
    t.integer "purchaseOfTreasuryStock"
    t.integer "decreaseInCapitalStructureItem"
    t.integer "cashOutflowsFromOtherFinancingActivities"
    t.integer "cashFlowsFromOtherFinancingActivities"
    t.integer "interestReceived_financing"
    t.integer "interestPaid_financing"
    t.integer "dividendsReceived_financing"
    t.integer "dividendsPaid_financing"
    t.integer "refundsOfIncomeTaxes_financing"
    t.integer "paymentsOfIncomeTaxes_financing"
    t.integer "cashFlowsFromDiscontinuedOperating_financing"
    t.integer "otherCashFlowsFromOperating_Investing_FinancingActivities"
    t.integer "changeOfConsolidatedScope"
    t.integer "differenceByChangesInForeignExchangeRates"
    t.integer "increaseInCashAndCashEquivalents"
    t.integer "cashAndCashEquivalentsAtTheBeginningOfYear"
    t.integer "cashAndCashEquivalentsAtTheEndOfYear"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "debt_to_equities", force: :cascade do |t|
    t.integer "year"
    t.integer "quarter"
    t.integer "stock_id"
    t.float "ratio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incomes", force: :cascade do |t|
    t.integer "year"
    t.integer "quarter"
    t.integer "stock_id"
    t.integer "flag"
    t.integer "revenue"
    t.integer "costOfGoodsSold"
    t.integer "grossProfit"
    t.integer "sellAdminExpense"
    t.integer "employeeSalary"
    t.integer "depreciation_amortization"
    t.integer "r_and_d_expense"
    t.integer "marketingExpense"
    t.integer "sellingExpense"
    t.integer "maintenanceExpense"
    t.integer "otherCostExpense"
    t.integer "otherSellingExpense"
    t.integer "operatingIncome"
    t.integer "financingProfit"
    t.integer "interestIncome"
    t.integer "dividendIncome"
    t.integer "currencyExchangeGains"
    t.integer "allowanceForBadDebts"
    t.integer "accountsReceivable"
    t.integer "gainOnSaleOfFinancialAsset"
    t.integer "gainOnValuationOfFinancialAssets"
    t.integer "recoveryOfImpairmentOnFinancialAssets"
    t.integer "gainOnDerivatives"
    t.integer "otherFinancialIncome"
    t.integer "financingExpense"
    t.integer "interestExpense"
    t.integer "currencyExchangeLoss"
    t.integer "expensesOfAllowanceForDoubtfulAccounts"
    t.integer "accountsReceivableLoss"
    t.integer "lossOnSaleOfFinancialAsset"
    t.integer "lossOnValuationOfFinancialAsset"
    t.integer "impairmentLossOnFinancialAsset"
    t.integer "lossOnDerivatives"
    t.integer "otherFinancialExpense"
    t.integer "otherProfit"
    t.integer "otherInterestIncome"
    t.integer "otherDividendIncome"
    t.integer "otherCurrencyExchangeGain"
    t.integer "gainOnInventory"
    t.integer "gainOnSaleOfInventory"
    t.integer "gainOnSaleOfAsset"
    t.integer "gainOnValuationOfAsset"
    t.integer "gainOnImpairmentLoss"
    t.integer "otherGainOnDerivative"
    t.integer "rentalIncome"
    t.integer "royaltyIncome"
    t.integer "commissionIncome"
    t.integer "gainOnAllowanceForDoubtfulAccount"
    t.integer "gainOnProvision"
    t.integer "otherOtherIncome"
    t.integer "otherExpense"
    t.integer "otherInterestExpense"
    t.integer "otherCurrencyExchangeLoss"
    t.integer "lossOnInventory"
    t.integer "lossOnSaleOfInventory"
    t.integer "lossOnSaleOfAsset"
    t.integer "lossOnValuationOfAsset"
    t.integer "otherImpairmentLoss"
    t.integer "otherLossOnDerivative"
    t.integer "otherExpenseOfAllowanceForDoubtfulAccounts"
    t.integer "lossOnProvision"
    t.integer "otherOtherExpense"
    t.integer "profitFromOccupancy"
    t.integer "gainInEquityMethod"
    t.integer "saleOfSecuritiesGain"
    t.integer "securityImpairmentLoss"
    t.integer "occupancyOther"
    t.integer "ebit"
    t.integer "incomeTaxExpense"
    t.integer "ongoingOperatingIncome"
    t.integer "discontinuedOperatingIncome"
    t.integer "netIncome"
    t.integer "netIncomeOwnersOfParentEquity"
    t.integer "netIncomeNonControllingInterestEquity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "industries", force: :cascade do |t|
    t.string "sectorName"
    t.string "industryGroup"
    t.string "industryName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "price_to_earnings", force: :cascade do |t|
    t.date "date"
    t.integer "stock_id"
    t.float "ratio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", force: :cascade do |t|
    t.integer "stock_id"
    t.float "price_clo"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratios", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "return_to_equities", force: :cascade do |t|
    t.integer "year"
    t.integer "quarter"
    t.integer "stock_id"
    t.float "ratio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string "stockCode"
    t.string "stockName"
    t.integer "industry_id"
    t.integer "stockPrice"
    t.integer "previousPrice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

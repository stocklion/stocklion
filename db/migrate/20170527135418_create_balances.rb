class CreateBalances < ActiveRecord::Migration[5.1]
  def change
    create_table :balances do |t|
      #해당 분기/년도 정보
      t.integer   :year
      t.integer   :quarter
      t.integer   :stock_id
      
      t.integer   :assets #자산
      t.integer   :currentAssets #유동자산
      t.integer   :inventories #재고자산
      t.integer   :currentBiologicalAssets #유동생물자산
      t.integer   :currentFinancialAssets #유동금융자산
      t.integer   :accountsRecievables_and_otherCurrentRecievables #매출채권및기타유동채권
      t.integer   :currentTaxAssets #당기법인세자산
      t.integer   :otherCurrentAssets #기타유동자산
      t.integer   :cah_and_cashEquivalents #현금및현금성자산
      t.integer   :assetHeldforSaleorDisposalGroup #매각예정비유동자산및처분자산집단

      t.integer   :nonCurrentAssets #비유동자산
      t.integer   :pPE #유형자산
      t.integer   :intangibleAssets #무형자산
      t.integer   :nonCurrentBiologicalAssets #비유동생물자산
      t.integer   :investmentPeroperties #투자부동산
      t.integer   :lTFinancialAssets #장기금융자산
      t.integer   :InvestmentsAssociates_Subsidiaries_JointVentures #관계기업등지분관련투자자산
      t.integer   :lTtradeRecievables_and_otherCurrentRecievables #장기매출채권및기타비유동채권
      t.integer   :deferredTaxAssets #이연법인세자산
      t.integer   :lTcurrentTaxAssets #장기당기법인세자산
      t.integer   :otherNonCurrentAssets #기타비유동자산
      t.integer   :otherFinancialInstitutionsAssets #기타금융업자산
    
      t.integer   :libailities #부채
      t.integer   :currentLiabilities #유동부채
      t.integer   :sTCorporateBonds #단기사채
      t.integer   :sTBorrowings #단기차입금
      t.integer   :currentLTliabilites #유동성장기부채
      t.integer   :currentFinancialLiabilities #유동금융부채
      t.integer   :accountsPayable_otherCurrentPayables #매입채무및기타유동채무
      t.integer   :currentProvisionsforEmployeeBenefits #유동종업원급여충당부채
      t.integer   :otherSTProvisions #기타단기충당부채
      t.integer   :currentTaxLiabilities #당기법인세부채
      t.integer   :otherCurrentLiablities #기타유동부채
      t.integer   :assetHeldforSaleorDisposalGroupLiabilities #매각예정으로분류된처분자산집단에포함된부채
    
      t.integer   :nonCurrentLiabilities #비유동부채
      t.integer   :corporateBonds #사채
      t.integer   :lTBorrowings #장기차입금
      t.integer   :nonCurrentFinancialLiabilities #비유동금융부채
      t.integer   :lTaccountsPayable_otherCurrentPayables #장기매입채무및기타비유동채무
      t.integer   :nonCurrentProvisionsforEmployeeBenefits #비유동종업원급여충당부채
      t.integer   :otherLTProvisions #기타장기충당부채
      t.integer   :deferredTaxALiabilities #이연법인세부채
      t.integer   :lTcurrentTaxLiabilities #장기당기법인세부채
      t.integer   :otherNonCurrentLiabilities #기타비유동부채
      t.integer   :otherFinancialInstitutionsLiabilities #기타금융업부채
    
      t.integer   :ShareholderEquity #자본
      t.integer   :ownersofParentEquity #지배기업주주지분
      t.integer   :capitalStock #자본금
      t.integer   :structuredCapitalSecurities #신종자본증권
      t.integer   :capitalSurplus #자본잉여금
      t.integer   :otherReserves #기타자본
      t.integer   :accumulatedOtherComprehensiveIncome #기타포괄손익누계액
      t.integer   :retainedEarnings #이익잉여금(결손금)
      t.integer   :nonControllingInterestsEquity #비지배주주지분

      t.timestamps null: false
    end
  end
end

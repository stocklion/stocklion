class Stock < ApplicationRecord

	has_many :balances
	has_many :cashes
	has_many :incomes
	belongs_to :industry
	has_many :prices
	has_many :debt_to_equity
	has_many :return_to_equity
end

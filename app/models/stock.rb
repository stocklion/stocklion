class Stock < ApplicationRecord

	has_many :balances
	has_many :cashes
	has_many :incomes
	belongs_to :industry
end

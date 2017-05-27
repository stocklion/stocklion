class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|

	t.string :stockCode
	t.string :stockName
	t.integer :industry_id
	t.integer :stockPrice
	t.integer :previousPrice

      t.timestamps
    end
  end
end

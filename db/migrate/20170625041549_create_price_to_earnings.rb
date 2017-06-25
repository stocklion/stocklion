class CreatePriceToEarnings < ActiveRecord::Migration[5.1]
  def change
    create_table :price_to_earnings do |t|

      t.date :date
      t.integer :stock_id
      t.float :ratio
      t.timestamps
    end
  end
end

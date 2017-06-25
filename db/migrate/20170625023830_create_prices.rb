class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|

      t.integer :stock_id
      t.float :price_clo
      t.timestamps
    end
  end
end

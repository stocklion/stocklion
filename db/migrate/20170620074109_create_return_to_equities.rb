class CreateReturnToEquities < ActiveRecord::Migration[5.1]
  def change
    create_table :return_to_equities do |t|

      t.integer :year
      t.integer :quarter
      t.integer :stock_id
      t.float :ratio
      t.timestamps
    end
  end
end

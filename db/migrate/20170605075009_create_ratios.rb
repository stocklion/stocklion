class CreateRatios < ActiveRecord::Migration[5.1]
  def change
    create_table :ratios do |t|

      t.timestamps
    end
  end
end

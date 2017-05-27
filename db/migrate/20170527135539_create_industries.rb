class CreateIndustries < ActiveRecord::Migration[5.1]
  def change
    create_table :industries do |t|
      t.string  :sectorName
      t.string  :industryGroup
      t.string  :industryName

      t.timestamps
    end
  end
end

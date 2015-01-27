class CreateTaxslabs < ActiveRecord::Migration
  def change
    create_table :taxslabs do |t|
      t.string :financialyear
      t.string :salaryrange
      t.decimal :taxrate
      t.decimal :cess1
      t.decimal :cess2
      t.decimal :surcharge

      t.timestamps
    end
  end
end

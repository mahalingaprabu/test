class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.string :investid
      t.string :section
      t.text :description

      t.timestamps
    end
  end
end

class CreateDeductions < ActiveRecord::Migration
  def change
    create_table :deductions do |t|
      t.string :deduction_mode
      t.string :deduction_type
      t.string :financial_year
      t.decimal :max_amount, :precision => 8, :scale => 3
      t.string :section
      t.decimal :section_limit, :precision => 8, :scale => 3

      t.timestamps
    end
  end
end

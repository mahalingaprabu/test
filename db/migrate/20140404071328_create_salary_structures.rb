class CreateSalaryStructures < ActiveRecord::Migration
  def change
    create_table :salary_structures do |t|
      t.string :empid
      t.string :empname
      t.decimal :basicpay, :precision => 8, :scale => 3
      t.decimal :hra, :precision => 8, :scale => 3
      t.decimal :da, :precision => 8, :scale => 3
      t.decimal :ca, :precision => 8, :scale => 3
      t.decimal :sa, :precision => 8, :scale => 3
      t.decimal :medical, :precision => 8, :scale => 3
      t.decimal :leavetransallowance, :precision => 8, :scale => 3
      t.decimal :bonus, :precision => 8, :scale => 3
      t.decimal :gross_salary, :precision => 8, :scale => 3
      t.decimal :salaryded, :precision => 8, :scale => 3
      t.belongs_to :employee, :precision => 8, :scale => 3
      t.timestamps
    end
  end
end

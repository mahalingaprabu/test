class CreateSalaryDetails < ActiveRecord::Migration
  def change
    create_table :salary_details do |t|
      t.string :empid
      t.string :empname
      t.date :month
      t.date :year
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
      t.decimal :professionaltax, :precision => 8, :scale => 3
      t.decimal :incometax, :precision => 8, :scale => 3
      t.decimal :gross_ded, :precision => 8, :scale => 3
      t.decimal :netsalary, :precision => 8, :scale => 3
t.belongs_to :employee
      t.timestamps
    end
  end
end

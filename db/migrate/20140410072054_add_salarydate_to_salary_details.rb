class AddSalarydateToSalaryDetails < ActiveRecord::Migration
  def change
    add_column :salary_details, :salarydate, :date
  end
end

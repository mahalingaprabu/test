class RemoveEmployeeIdFromSalaryDetails < ActiveRecord::Migration
  def up
    remove_column :salary_details, :employee_id
  end

  def down
    add_column :salary_details, :employee_id, :integer
  end
end

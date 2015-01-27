class RemoveEmployeeIdFromSalaryStructures < ActiveRecord::Migration
  def up
    remove_column :salary_structures, :employee_id
  end

  def down
    add_column :salary_structures, :employee_id, :integer
  end
end

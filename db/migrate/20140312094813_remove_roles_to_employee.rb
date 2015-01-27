class RemoveRolesToEmployee < ActiveRecord::Migration
  def up
    remove_column :employees, :roles
  end

  def down
    add_column :employees, :roles, :string
  end
end

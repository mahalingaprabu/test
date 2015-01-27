class AddRolesToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :roles, :string
  end
end

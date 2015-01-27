class RemoveyearFromsalaryDetails < ActiveRecord::Migration
  def up
	remove_column :salary_details, :year
  end

  def down
  end
end

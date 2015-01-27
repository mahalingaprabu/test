class RemovemonthFromsalaryDetails < ActiveRecord::Migration
  def up
	remove_column :salary_details, :month
  end

  def down
  end
end

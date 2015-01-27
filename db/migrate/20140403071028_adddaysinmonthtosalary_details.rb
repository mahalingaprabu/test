class AdddaysinmonthtosalaryDetails < ActiveRecord::Migration
  def up
add_column :salary_details, :daysinmonth, :integer
  end

  def down
  end
end

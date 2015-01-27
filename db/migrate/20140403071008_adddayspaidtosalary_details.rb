class AdddayspaidtosalaryDetails < ActiveRecord::Migration
  def up
add_column :salary_details, :dayspaid, :integer
  end

  def down
  end
end

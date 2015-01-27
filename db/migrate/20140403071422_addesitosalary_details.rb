class AddesitosalaryDetails < ActiveRecord::Migration
  def up
add_column :salary_details, :esi, :decimal
  end

  def down
  end
end

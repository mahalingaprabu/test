class AddEsiToSalaryStructure < ActiveRecord::Migration
  def change
    add_column :salary_structures, :esi, :decimal
  end
end

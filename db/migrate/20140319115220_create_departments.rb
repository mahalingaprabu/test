class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :depid
      t.string :depname

      t.timestamps
    end
  end
end
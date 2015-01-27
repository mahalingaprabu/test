class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :empid
      t.string :empname
      t.date :dob
      t.integer :age
      t.string :gender
      t.date :doj
      t.string :designation
      t.string :managerid
      t.text :address
      t.integer :mobno
      t.string :panno
      t.string :email
      t.string :depid
	t.references :depid

      t.timestamps
    end
  end
end

class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :empid
      t.string :empname
      t.string :ctype
      t.date :cdate
      t.text :summary
      t.text :description
      t.string :assignto
      t.string :status
	t.references :empid

      t.timestamps
    end
  end
end

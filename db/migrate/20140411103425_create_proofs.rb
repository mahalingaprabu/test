class CreateProofs < ActiveRecord::Migration
  def change
    create_table :proofs do |t|
      t.string :empid
      t.string :empname
      t.string :prooftype
      t.date :senddate
      

      t.timestamps
    end
  end
end

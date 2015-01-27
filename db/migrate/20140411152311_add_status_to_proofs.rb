class AddStatusToProofs < ActiveRecord::Migration
  def change
    add_column :proofs, :status, :string
  end
end

class AddCommentToProofs < ActiveRecord::Migration
  def change
    add_column :proofs, :comment, :string
  end
end

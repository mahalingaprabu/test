class AddCommentsToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :comments, :text
  end
end

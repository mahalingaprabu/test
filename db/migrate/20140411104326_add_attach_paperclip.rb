class AddAttachPaperclip < ActiveRecord::Migration
  def self.up
add_column :proofs, :attach_file_name,    :string
add_column :proofs, :attach_content_type, :string
      add_column :proofs, :attach_file_size,    :integer
     add_column :proofs, :attach_updated_at,   :datetime
  end

  def self.sdown
remove_column :proofs, :attach_file_name
     remove_column :proofs, :attach_content_type
     remove_column :proofs, :attach_file_size
     remove_column :proofs, :attach_updated_at
  end
end

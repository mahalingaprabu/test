class AddPicPaperclip < ActiveRecord::Migration
  def self.up
add_column :employees, :pic_file_name,    :string
     add_column :employees, :pic_content_type, :string
      add_column :employees, :pic_file_size,    :integer
    add_column :employees, :pic_updated_at,   :datetime
  end

  def self.down
 remove_column :employees, :pic_file_name
    remove_column :employees, :pic_content_type     
remove_column :employees, :pic_file_size
     remove_column :employees, :pic_updated_at
  end
end

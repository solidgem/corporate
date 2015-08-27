class AddProfileImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_image_id, :string
    add_column :users, :profile_image_filename, :string
    add_column :users, :profile_image_size, :integer
    add_column :users, :profile_image_content_type, :string
  end
end

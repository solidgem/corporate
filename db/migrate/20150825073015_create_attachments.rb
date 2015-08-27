class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :file_id
      t.string :file_filename
      t.integer :file_size
      t.string :file_content_type
      t.integer :entity_id
      t.string :entity_type

      t.timestamps null: false
    end
  end
end

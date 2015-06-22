class CreateTaskComments < ActiveRecord::Migration
  def change
    create_table :task_comments do |t|
      t.integer :task_id
      t.text :content
      t.integer :user_id
      t.integer :elapsed_time

      t.timestamps null: false
    end
  end
end

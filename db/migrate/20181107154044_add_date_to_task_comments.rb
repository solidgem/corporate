class AddDateToTaskComments < ActiveRecord::Migration
  def change
     add_column :task_comments, :date, :date
  end
end

class AddAccessDataToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :access_data, :text
  end
end

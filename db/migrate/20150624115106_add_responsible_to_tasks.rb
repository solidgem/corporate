class AddResponsibleToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :responsible_user_id, :integer
  end
end

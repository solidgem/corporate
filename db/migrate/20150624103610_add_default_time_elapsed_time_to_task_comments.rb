class AddDefaultTimeElapsedTimeToTaskComments < ActiveRecord::Migration
  class Comment < ActiveRecord::Base
    self.table_name = :task_comments
  end

  def up
    change_column_default :task_comments, :elapsed_time, 0
    Comment.where(elapsed_time: nil).update_all(elapsed_time: 0)
  end

  def down
    change_column_default :task_comments, :elapsed_time, nil
  end
end

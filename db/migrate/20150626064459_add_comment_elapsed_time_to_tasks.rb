class AddCommentElapsedTimeToTasks < ActiveRecord::Migration

  def self.up

    add_column :tasks, :comment_elapsed_time, :integer, null: false, default: 0

  end

  def self.down

    remove_column :tasks, :comment_elapsed_time

  end

end

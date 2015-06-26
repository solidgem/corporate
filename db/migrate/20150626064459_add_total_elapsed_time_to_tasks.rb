class AddTotalElapsedTimeToTasks < ActiveRecord::Migration

  def self.up

    add_column :tasks, :total_elapsed_time, :integer, null: false, default: 0

  end

  def self.down

    remove_column :tasks, :total_elapsed_time

  end

end

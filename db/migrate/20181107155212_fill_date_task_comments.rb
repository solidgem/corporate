class FillDateTaskComments < ActiveRecord::Migration
  def up
    execute "UPDATE task_comments SET date = created_at"
  end

  def down
  end
end

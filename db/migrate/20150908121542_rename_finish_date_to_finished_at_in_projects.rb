class RenameFinishDateToFinishedAtInProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :finish_date, :finished_at
  end
end

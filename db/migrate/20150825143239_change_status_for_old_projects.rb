class ChangeStatusForOldProjects < ActiveRecord::Migration
  def change
    Project.where(status: nil).update_all(status: 'active')
  end
end

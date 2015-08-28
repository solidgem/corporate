class ChangeStatusForOldProjects < ActiveRecord::Migration
  class Project < ActiveRecord::Base
  end

  def up
    Project.where(status: nil).update_all(status: 'active')
  end

  def down
  end
end

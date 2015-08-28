class ChangeStatusForOldProjects < ActiveRecord::Migration
  class Project < ActiveRecord::Base
  end

  def up
    Project.update_all(status: 'active')
  end

  def down
  end
end

class AddDefaultDeadlineForProjects < ActiveRecord::Migration
  class Project < ActiveRecord::Base
  end

  def up
    Project.update_all(deadline: Date.today+100.years)
  end

  def down
  end
end

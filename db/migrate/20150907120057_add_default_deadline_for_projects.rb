class AddDefaultDeadlineForProjects < ActiveRecord::Migration
  class Project < ActiveRecord::Base
  end

  def up
    Project.update_all(deadline: 100.years.since)
  end

  def down
  end
end

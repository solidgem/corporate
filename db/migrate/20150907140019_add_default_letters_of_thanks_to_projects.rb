class AddDefaultLettersOfThanksToProjects < ActiveRecord::Migration
  class Project < ActiveRecord::Base
  end

  def up
    Project.update_all(letters_of_thanks: false)
    change_column :projects, :letters_of_thanks, :boolean, default: false
  end
end

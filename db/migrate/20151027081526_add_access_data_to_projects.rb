class AddAccessDataToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :access_data, :text
  end
end

class AddResponsibleToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :responsible_user_id, :integer
  end
end

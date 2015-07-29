class AddCostToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :cost, :integer
  end
end

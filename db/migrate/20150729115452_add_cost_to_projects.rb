class AddCostToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :cost, :integer, default: 0
  end
end

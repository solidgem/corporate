class AddActsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :contract_act_id, :integer
  end
end

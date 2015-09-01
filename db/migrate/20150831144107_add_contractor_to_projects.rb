class AddContractorToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :contractor_id, :integer
  end
end

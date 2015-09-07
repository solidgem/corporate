class AddCounterpartyToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :counterparty_id, :integer
  end
end

class AddContractorToRepresentatives < ActiveRecord::Migration
  def change
    add_column :representatives, :contractor_id, :integer
  end
end

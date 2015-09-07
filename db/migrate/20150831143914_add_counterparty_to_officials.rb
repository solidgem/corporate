class AddCounterpartyToOfficials < ActiveRecord::Migration
  def change
    add_column :counterparty_officials, :counterparty_id, :integer
  end
end

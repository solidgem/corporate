class AddCounterpartyToRepresentatives < ActiveRecord::Migration
  def change
    add_column :officials, :counterparty_id, :integer
  end
end

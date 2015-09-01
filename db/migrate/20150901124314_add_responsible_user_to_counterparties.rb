class AddResponsibleUserToCounterparties < ActiveRecord::Migration
  def change
    add_column :counterparties, :responsible_user_id, :integer
  end
end

class RemoveAgreementsFromCounterparties < ActiveRecord::Migration
  def change
    remove_column :counterparties, :agreements, :text
  end
end

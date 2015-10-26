class AddTimestampsToContractSupplementaryAgreements < ActiveRecord::Migration
  class ContractSupplementaryAgreement < ActiveRecord::Base
  end

  def up
    add_column :contract_supplementary_agreements, :created_at, :integer
    add_column :contract_supplementary_agreements, :updated_at, :integer

    ContractSupplementaryAgreement.update_all(created_at: DateTime.current, updated_at: DateTime.current)

    change_column_null :contract_supplementary_agreements, :created_at, false
    change_column_null :contract_supplementary_agreements, :updated_at, false
  end

  def down
    remove_column :contract_supplementary_agreements, :created_at, :integer
    remove_column :contract_supplementary_agreements, :updated_at, :integer

  end
end

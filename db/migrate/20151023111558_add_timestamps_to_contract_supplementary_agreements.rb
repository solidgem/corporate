class AddTimestampsToContractSupplementaryAgreements < ActiveRecord::Migration
  class ContractSupplementaryAgreement < ActiveRecord::Base
  end

  def up
    add_column :contract_supplementary_agreements, :created_at, :datetime
    add_column :contract_supplementary_agreements, :updated_at, :datetime

    ContractSupplementaryAgreement.update_all(created_at: DateTime.current, updated_at: DateTime.current)

    change_column_null :contract_supplementary_agreements, :created_at, false
    change_column_null :contract_supplementary_agreements, :updated_at, false
  end

  def down
    remove_column :contract_supplementary_agreements, :created_at, :datetime
    remove_column :contract_supplementary_agreements, :updated_at, :datetime

  end
end

class AddTimestampsToContractSupplementaryAgreements < ActiveRecord::Migration
  class Contract::SupplementaryAgreement < ActiveRecord::Base
  end

  def up
    add_timestamps(:contract_supplementary_agreements)
    Contract::SupplementaryAgreement.update_all(created_at: DateTime.current, updated_at: DateTime.current)
  end

  def down
    remove_timestamps(:contract_supplementary_agreements)
  end
end

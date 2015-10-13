class Contract::SupplementaryAgreementPolicy < ApplicationPolicy
  delegate :create?, :show?, :update?, :edit?, to: :contract_policy

  private

  def contract_policy
    @contract_policy ||= ContractPolicy.new(user, record.contract)
  end
end

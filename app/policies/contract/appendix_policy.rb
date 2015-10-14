class Contract::AppendixPolicy < ApplicationPolicy
  delegate :create?, :update?, to: :contract_policy

  def index?
    return true if user.administrator?
    return true if user.manager?
    false
  end

  private

  def contract_policy
    @contract_policy ||= ContractPolicy.new(user, record.contract)
  end
end

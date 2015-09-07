class Counterparty::OfficialPolicy < ApplicationPolicy
  delegate :new?, :show?, :update?, :edit?, :create?, to: :counterparty_policy

  private

  def counterparty_policy
    @counterparty_policy ||= CounterpartyPolicy.new(user, record.counterparty)
  end
end

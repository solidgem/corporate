class ContractPolicy < ApplicationPolicy
  def index?
    return true if user.administrator?
    return true if user.manager?
    false
  end

  def update?
    return true if user.administrator?
    return true if user.manager?
    false
  end

  def create?
    return true if user.administrator?
    return true if user.manager?
    false
  end

  def show?
    return true if user.administrator?
    return true if user.manager?
    false
  end
end

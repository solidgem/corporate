class CounterpartyPolicy < ApplicationPolicy
  def index?
    return true if user.administrator?
    return true if user.manager?
    false
  end

  def show?
    return true if user.administrator?
    return true if user.manager?
    false
  end

  def new?
    return true if user.administrator?
    return true if user.manager?
    false
  end

  def edit?
    return true if user.administrator?
    return true if user.manager?
    false
  end

  def update?
    edit?
  end

  def create?
    new?
  end

  def readable_attributes
    [:id, :title, :requisites, :contacts, :agreements, :site, :comment]
  end
end

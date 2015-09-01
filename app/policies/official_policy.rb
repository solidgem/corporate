class OfficialPolicy < ApplicationPolicy
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

  def readable_attributes
    [:id, :name, :contractor, :position, :contacts]
  end
end

class RepresentativePolicy < ApplicationPolicy
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
    [:id, :name, :contractor, :position, :contacts]
  end
end

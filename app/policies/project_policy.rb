class ProjectPolicy < ApplicationPolicy
  def index?
    ! user.guest?
  end

  def show?
    create?
  end

  def create?
    return true if user.administrator?
    return true if user.manager?
    false
  end

  def update?
    create?
  end

  def permitted_attributes
    [:title, :cost]
  end
end

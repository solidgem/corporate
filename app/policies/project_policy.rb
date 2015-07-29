class ProjectPolicy < ApplicationPolicy
  def index?
    ! user.guest?
  end

  def show?
    ! user.guest?
  end

  def create?
    return true if user.top_manager?
    return true if user.manager?
    false
  end

  def update?
    create?
  end
end

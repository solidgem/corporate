class ProjectPolicy < ApplicationPolicy
  def index?
    ! user.guest?
  end

  def show?
    create?
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

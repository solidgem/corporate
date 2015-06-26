class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if user.top_manager?
      return scope.for_manager(user) if user.manager?
      return scope.for_worker(user) if user.worker?
      scope.none
    end
  end

  def index?
    ! user.guest?
  end

  def show?
    return false if user.guest?
    return true if user.top_manager?
    record.member? user
  end

  def create?
    ! user.guest?
  end

  def update?
    show?
  end

  def destroy?
    show?
  end
end

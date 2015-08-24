class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if user.administrator?
      return scope.all if user.manager?
      return scope.for_worker(user) if user.worker?
      scope.none
    end
  end

  def index?
    ! user.guest?
  end

  def show?
    return true if user.administrator?
    return true if user.manager?
    return true if scope.for_worker(user).include? record
    false
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
    [:title, :cost, :responsible_user_id]
  end

  def readable_attributes
    attrs = [:id, :title, :responsible_user, :updated_at, :created_at]
    attrs.push :cost if user.administrator? || user.manager?
    attrs
  end
end

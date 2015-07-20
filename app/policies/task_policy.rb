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
    return true if user.top_manager?
    return true if record.member? user
    false
  end

  def permitted_attributes
    common = [:status_event]
    common << major_fields if update_major_fields?
    common
  end

  private

  def update_major_fields?
    return true if record == :task
    record.creator == user || record.responsible_user == user || user.top_manager?
  end

  def major_fields
    [:title, :description, :deadline, :responsible_user_id, user_ids: []]
  end
end

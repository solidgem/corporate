class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      default_scope = scope.web
      return default_scope if user.administrator?
      return default_scope.for_manager(user) if user.manager?
      return default_scope.for_worker(user) if user.worker?
      default_scope.none
    end
  end

  def index?
    ! user.guest?
  end

  def show?
    return false if user.guest?
    return true if user.administrator?
    record.member? user
  end

  def create?
    ! user.guest?
  end

  def update?
    return true if user.administrator?
    return true if record.creator == user
    return true if record.responsible_user == user
    false
  end

  def status?
    return true if user.administrator?
    return true if record.member? user
    false
  end

  def permitted_attributes
    [:title, :description, :access_data, :status_event,
     :deadline, :competence, :responsible_user_id, :project_id,
     user_ids: [], attachments_files: [], attachments_attributes: [:id, :_destroy]]
  end
end

class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if user.administrator?
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

  def available_projects
    return Project.all if user.administrator? || user.manager?
    return Project.for_worker(user) if user.worker?
    []
  end

  def permitted_attributes
    [:title, :description, :access_data, :status_event,
     :deadline, :competence, :responsible_user_id, :project_id,
     user_ids: [], attachments_files: [], attachments_attributes: [:id, :_destroy]]
  end
end

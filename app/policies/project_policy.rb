class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.web if user.administrator?
      return scope.web if user.manager?
      return scope.web.for_worker(user) if user.worker?
      scope.none
    end
  end

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

  def status?
    return true if user.administrator?
    return true if user.manager?
    false
  end

  def permitted_attributes
    attrs = [:title, :cost, :responsible_user_id, :deadline, :kind]
    attrs.push :complaints, :critical_complaints, :letters_of_thanks if user.administrator?
    attrs.push :counterparty_id if user.administrator? || user.manager?
    attrs
  end

  def readable_attributes
    attrs = [:id, :title, :responsible_user_id, :status, :updated_at, :created_at, :kind,
             :complaints, :critical_complaints, :letters_of_thanks, :deadline, :finished_at, :overdue_kind]
    attrs.push :cost, :counterparty_id, :contract_act_id if user.administrator? || user.manager?
    attrs
  end
end

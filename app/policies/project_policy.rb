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
    attrs.push  :finish_date, :overdue_kind if user.administrator? || user.manager?
    attrs.push :complaints, :critical_complaints, :letters_of_thanks if user.administrator?
    attrs
  end

  def readable_attributes
    attrs = [:id, :title, :responsible_user, :status, :updated_at, :created_at, :kind,
             :complaints, :critical_complaints, :letters_of_thanks, :deadline, :finish_date, :overdue_kind]
    attrs.push :cost, :counterparty_id if user.administrator? || user.manager?
    attrs
  end
end

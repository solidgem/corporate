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

  def readable_attributes
    attrs = [:id, :title, :updated_at, :created_at]
    attrs.push :cost if user.administrator? || user.manager?
    attrs
  end
end

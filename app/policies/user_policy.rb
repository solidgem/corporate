class UserPolicy < ApplicationPolicy
  def index?
    ! user.guest?
  end

  def show?
    ! user.guest?
  end

  def update?
    return true if user.top_manager?
    record == user
  end

  def permitted_attributes
    common = [:name, :contacts, :email, :requisites, :position, :password, :password_confirmation]
    common << :role if user.top_manager?
    common
  end
end

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
    common = [:name, :email, :password, :password_confirmation,
              :avatar, :avatar_cache, :remove_avatar,
              :contacts, :requisites, :position]
    common << :role if user.top_manager?
    common
  end
end

class UserPolicy < ApplicationPolicy
  def index?
    ! user.guest?
  end

  def show?
    ! user.guest?
  end

  def update?
    return false if user.guest?
    return true if user.top_manager?
    return true if record.worker? && user.manager?
    record == user
  end

  def statistics_show?
    return false if user.guest?
    return true if user.top_manager?
    record == user
  end

  def readable_attributes
    attrs = [:name, :email, :avatar, :contacts, :position]
    attrs.push :role, :role_text if user.top_manager?
    attrs.push :hour_rate, :requisites, :external_hour_rate if user.manager? || user.top_manager?
    attrs.push :hour_rate, :requisites if record == user
    attrs
  end

  def permitted_attributes
    attrs = [:name, :email, :password, :password_confirmation,
             :avatar, :avatar_cache, :remove_avatar,
             :contacts, :requisites, :position]
    attrs.push :role if user.top_manager?
    attrs.push :hour_rate, :external_hour_rate if user.manager? || user.top_manager?
    attrs
  end
end

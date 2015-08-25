class UserPolicy < ApplicationPolicy
  def index?
    ! user.guest?
  end

  def show?
    ! user.guest?
  end

  def update?
    return false if user.guest?
    return true if user.administrator?
    return true if record.worker? && user.manager?
    record == user
  end

  def statistics_show?
    return false if user.guest?
    return true if user.administrator?
    return true if user.manager?
    record == user
  end

  def readable_attributes
    attrs = [:name, :email, :profile_image, :profile_image_thumb, :contacts, :position]
    attrs.push :role, :role_text if user.administrator?
    attrs.push :hour_rate, :requisites, :external_hour_rate if user.manager? || user.administrator?
    attrs.push :hour_rate, :requisites if record == user
    attrs
  end

  def permitted_attributes
    attrs = [:email, :password, :password_confirmation,
             :profile_image, :remove_profile_image,
             :contacts, :requisites]
    attrs.push :role, :name, :position if user.administrator?
    attrs.push :hour_rate, :external_hour_rate if user.manager? || user.administrator?
    attrs
  end
end

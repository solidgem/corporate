class SessionPolicy < ApplicationPolicy
  def create?
    user.guest?
  end

  def destroy?
    ! user.guest?
  end

  def update?
    return false if user.guest?
    return false if user.worker?
    return false if user.manager?
    true
  end
end

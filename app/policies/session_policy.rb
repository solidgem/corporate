class SessionPolicy < ApplicationPolicy
  def create?
    user.guest?
  end

  def destroy?
    ! user.guest?
  end

  def update?
    return true if user.administrator?
    false
  end
end

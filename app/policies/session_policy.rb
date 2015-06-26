class SessionPolicy < ApplicationPolicy
  def create?
    user.guest?
  end

  def destroy?
    ! user.guest?
  end
end

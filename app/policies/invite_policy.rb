class InvitePolicy < ApplicationPolicy
  def create?
    user.administrator? || user.manager?
  end

  def available_roles
    return User.role.values if user.administrator?
    return ['worker'] if user.manager?
    []
  end
end

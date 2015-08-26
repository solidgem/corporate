class InvitePolicy < ApplicationPolicy
  def create?
    user.administrator? || user.manager?
  end

  def permitted_roles
    return [[User.role.worker.text, :worker]] if user.manager?
    User.role.options if user.administrator?
  end
end

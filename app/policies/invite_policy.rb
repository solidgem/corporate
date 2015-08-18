class InvitePolicy < ApplicationPolicy
  def create?
    user.administrator?
  end
end

class InvitePolicy < ApplicationPolicy
  def create?
    user.top_manager?
  end
end

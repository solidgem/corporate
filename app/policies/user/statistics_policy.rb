class User::StatisticsPolicy < ApplicationPolicy
  def show?
    return true if user.top_manager?
    record == user
  end
end

class Task::CommentPolicy < ApplicationPolicy
  delegate :index?, :show?, :update?, :edit?, :destroy?, to: :task_policy

  def new?
    return false if user.guest?
    return true if user.top_manager?
    return true if record.task.member? user
    false
  end

  def create?
    new?
  end
  private

  def task_policy
    @task_policy ||= TaskPolicy.new(user, record.task)
  end
end

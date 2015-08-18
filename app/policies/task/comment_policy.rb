class Task::CommentPolicy < ApplicationPolicy
  delegate :index?, :show?, :update?, :edit?, :destroy?, to: :task_policy

  def create?
    return false if user.guest?
    return true if user.administrator?
    return true if record.task.member? user
    false
  end
  
  private

  def task_policy
    @task_policy ||= TaskPolicy.new(user, record.task)
  end
end

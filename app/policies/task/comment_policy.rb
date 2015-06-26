class Task::CommentPolicy < ApplicationPolicy
  delegate :index?, :show?, :new?, :create?, :update?, :edit?, :destroy?, to: :task_policy

  private

  def task_policy
    @task_policy ||= TaskPolicy.new(user, record.task)
  end
end

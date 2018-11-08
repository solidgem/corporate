module UserStatisticsQuery
  module_function

  def perform(user, start_date, end_date)
    comment_relation = Task::Comment.where(user: user).where.not(elapsed_time: 0)
    comment_relation = comment_relation.more_or_equal(date: start_date.to_date) if start_date.present?
    comment_relation = comment_relation.less_than(date: end_date.to_date) if end_date.present?

    elapsed_time_by_task_id = comment_relation.group(:task_id).sum(:elapsed_time)
    tasks = Task.where(id: elapsed_time_by_task_id.keys)
    tasks.map do |task|
      {
          task: task,
          user_elapsed_time: elapsed_time_by_task_id[task.id],
          reward: elapsed_time_by_task_id[task.id] / 1.hour.to_f * user.hour_rate
      }
    end
  end
end

module UserStatisticsQuery
  module_function

  def perform(user, start_date, end_date)
    elapsed_time_by_task_id = Task::Comment.where(user: user).where.not(elapsed_time: 0).group(:task_id).sum(:elapsed_time)
    tasks = Task.where(id: elapsed_time_by_task_id.keys)
    tasks.map do |task|
      {
          task: task,
          user_elapsed_time: elapsed_time_by_task_id[task.id]
      }
    end
  end
end

module TasksCostQuery
  module_function

  def perform(project)
    response = ActiveRecord::Base.connection.exec_query <<-SQL
      SELECT tasks.id, SUM(task_comments.elapsed_time / 3600.0 * users.external_hour_rate) as cost
      FROM tasks
      JOIN task_comments ON task_comments.task_id = tasks.id
      JOIN users ON users.id = task_comments.user_id
      WHERE tasks.project_id = #{project.id}
      GROUP BY tasks.id
    SQL

    cost_by_task_id = response.rows.map{ |id, cost| [id.to_i, cost.to_f] }.to_h

    project.tasks.map do |task|
      {
          task: task,
          cost: cost_by_task_id.fetch(task.id, 0.0)
      }
    end
  end
end

module ProjectsBonusesQuery
  module_function

  def perform(user, start_date, end_date)
    response = ActiveRecord::Base.connection.exec_query <<-SQL
      SELECT projects.id, SUM(COALESCE(task_comments.elapsed_time, 0) / 3600.0 * COALESCE(users.external_hour_rate, 0)) as expenses
      FROM projects
      LEFT OUTER JOIN tasks ON tasks.project_id = projects.id
      LEFT OUTER JOIN task_comments ON task_comments.task_id = tasks.id
      LEFT OUTER JOIN users ON users.id = task_comments.user_id
      WHERE projects.responsible_user_id = #{user.id}
        AND projects.status = 'finished'
        AND projects.finished_at < '#{end_date}'
        AND projects.finished_at > '#{start_date}'
      GROUP BY projects.id
    SQL

    expenses_by_id = response.rows.map{ |id, expenses| [id.to_i, expenses.to_f] }.to_h
    finished_projects = Project.where(id: expenses_by_id.keys).includes(:counterparty)

    finished_projects.map do |project|
      expenses = expenses_by_id.fetch(project.id, 0.0)
      rest = project.cost - expenses

      bonus = PmBonusCalculator.perform project, rest
      {
          project: project,
          bonus: bonus,
          expenses: expenses,
          rest: rest,
      }
    end
  end
end

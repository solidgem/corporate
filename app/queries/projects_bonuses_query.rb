module ProjectsBonusesQuery
  module_function

  def perform(user, start_date, end_date)
    base_percent = configs[:base_percent].to_f
    deadline_bonus_coefficients = configs[:deadline_bonus_coefficients]
    response = ActiveRecord::Base.connection.exec_query <<-SQL
      SELECT projects.id,
             (projects.cost - SUM(COALESCE(task_comments.elapsed_time,0) / 3600.0 * COALESCE(users.external_hour_rate,0))) *
             (#{base_percent} +
              CASE
                WHEN projects.finished_at < projects.deadline
                  THEN #{deadline_bonus_coefficients[:pm_ahead_of_schedule]}
                WHEN projects.finished_at = projects.deadline
                  THEN #{deadline_bonus_coefficients[:pm_in_time]}
                WHEN projects.finished_at > projects.deadline AND projects.overdue_kind = 'customer_fault'
                  THEN #{deadline_bonus_coefficients[:pm_delayed_by_2_weeks_fault_customer]}
                WHEN (projects.finished_at - projects.deadline) <= INTERVAL '2 weeks' AND projects.overdue_kind = 'company_fault'
                  THEN #{deadline_bonus_coefficients[:pm_delayed_by_2_weeks_fault_company]}
                WHEN (projects.finished_at - projects.deadline) > INTERVAL '2 weeks' AND projects.overdue_kind = 'company_fault'
                  THEN #{deadline_bonus_coefficients[:pm_delayed_by_4_weeks_fault_company]}
               END)
              /
              100 +
              (COALESCE(projects.complaints,0) * #{configs[:complaints].to_f} +
               COALESCE(projects.critical_complaints,0) * #{configs[:critical_complaints].to_f} +
               (CASE WHEN projects.letters_of_thanks THEN #{configs[:letters_of_thanks].to_f} ELSE 0 END)) as bonus
      FROM projects
      LEFT OUTER JOIN tasks ON tasks.project_id = projects.id
      LEFT OUTER JOIN task_comments ON task_comments.task_id = tasks.id
      LEFT OUTER JOIN users ON users.id = task_comments.user_id
      WHERE projects.responsible_user_id = #{user.id} AND projects.finished_at < '#{end_date}' AND projects.finished_at > '#{start_date}'
      GROUP BY projects.id
    SQL
    bonuses = response.rows.map{ |id, bonus| [id.to_i, bonus.to_f] }.to_h
    finished_projects = Project.where(id: bonuses.keys)
    finished_projects.map do |project|
      {
          project: project,
          bonus: bonuses.fetch(project.id, 0.0)
      }
    end
  end

  def configs
    CustomConfigs.by_type(:pm_bonus_coefficients)
  end
end
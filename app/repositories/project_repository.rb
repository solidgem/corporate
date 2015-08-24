module ProjectRepository
  extend ActiveSupport::Concern

  included do
    scope :for_user, ->(user)   { joins('LEFT OUTER JOIN tasks on tasks.project_id = projects.id')
                                 .joins('LEFT OUTER JOIN task_participations ON task_participations.task_id = tasks.id')
                                 .where('tasks.creator_id = :user_id
                                        OR tasks.responsible_user_id = :user_id
                                        OR task_participations.user_id = :user_id', user_id: user.id)
                                 .uniq }
    scope :for_worker, ->(worker) { for_user(worker) }
  end
end

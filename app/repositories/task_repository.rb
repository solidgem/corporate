module TaskRepository
  extend ActiveSupport::Concern

  included do
    scope :for_user, ->(user) { joins('LEFT OUTER JOIN task_participations ON task_participations.task_id = tasks.id')
                                    .where('tasks.creator_id = :user_id
                                            OR tasks.responsible_user_id = :user_id
                                            OR task_participations.user_id = :user_id', user_id: user.id) }
    scope :for_manager, ->(manager) { for_user(manager) }
    scope :for_worker, ->(worker) { for_user(worker) }
  end
end
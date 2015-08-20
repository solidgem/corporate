module TaskRepository
  extend ActiveSupport::Concern

  included do
    scope :for_user, ->(user) { joins{ task_participations.outer }
                               .where{ (tasks.creator_id == my{user.id}) \
                                     | (tasks.responsible_user_id == my{user.id}) \
                                     | (task_participations.user_id == my{user.id}) } }
    scope :for_manager, ->(manager) { for_user(manager) }
    scope :for_worker, ->(worker) { for_user(worker) }
  end

  def members
    User.uniq
        .joins{ task_participations.outer }
        .where{ (users.id == my{creator_id}) \
              | (users.id == my{responsible_user_id}) \
              | (task_participations.task_id == my{id}) }
  end
end

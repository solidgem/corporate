module ProjectRepository
  extend ActiveSupport::Concern

  included do
    # Код дублируется из task_repository, т.к. не удалось сделать merge с правильным join. 
    # http://api.rubyonrails.org/classes/ActiveRecord/SpawnMethods.html#method-i-merge
    # https://github.com/activerecord-hackery/squeel
        scope :for_user, ->(user) { joins{ tasks.task_participations }
                                .where{ (tasks.creator_id == my{user.id}) \
                                      | (tasks.responsible_user_id == my{user.id}) \
                                      | (task_participations.user_id == my{user.id}) }
                                .uniq }
    scope :for_worker, ->(worker) { for_user(worker) }
    scope :web, -> { order(:title) }
  end
end

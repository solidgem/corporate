module Task::CommentRepository
  extend ActiveSupport::Concern
  include UsefullScopes

  included do
    scope :ordered, ->{ order(id: :desc) }
  end
end

module Task::CommentRepository
  extend ActiveSupport::Concern
  include UsefullScopes

  included do
    scope :web, ->{ includes(:user, :attachments).order(id: :desc) }

  end
end

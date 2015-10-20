module ActRepository
  extend ActiveSupport::Concern

  included do
    scope :web, -> { includes(:attachments, :project).order(:id) }
  end
end

module ActRepository
  extend ActiveSupport::Concern

  included do
    scope :web, -> { includes(:attachments, :project, :document).order(:id) }
  end
end

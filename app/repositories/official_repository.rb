module OfficialRepository
  extend ActiveSupport::Concern

  included do
    scope :web, -> { order(:name) }
  end
end

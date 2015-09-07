module Counterparty::OfficialRepository
  extend ActiveSupport::Concern

  included do
    scope :web, -> { order(:full_name) }
  end
end

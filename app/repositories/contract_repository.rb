module ContractRepository
  extend ActiveSupport::Concern

  included do
    scope :web, -> { includes(:service_kind, :counterparty, :contact_person) }
  end
end

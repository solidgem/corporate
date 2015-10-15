module Contract::SupplementaryAgreementRepository
  extend ActiveSupport::Concern

  included do
    scope :web, ->{ includes(:contact_person, :attachments) }
  end
end

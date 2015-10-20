class Contract::SupplementaryAgreement < ActiveRecord::Base
  include SupplementaryAgreementRepository
  include WithAttachments

  belongs_to :contract
  belongs_to :contact_person, class_name: 'User'

  has_many :acts, as: :document

  validates :order_number, presence: true
  validates :date, presence: true

  def to_s
    order_number.to_s
  end
end

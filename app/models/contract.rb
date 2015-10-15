class Contract < ActiveRecord::Base
  include WithAttachments
  include ContractRepository

  belongs_to :service_kind
  belongs_to :counterparty
  belongs_to :contact_person, class_name: 'User'

  has_many :supplementary_agreements
  has_many :appendixes

  validates :order_number, presence: true
  validates :service_kind, presence: true
  validates :date, presence: true
  validates :counterparty, presence: true

  def self.use_relative_model_naming?
    true
  end

  def number
    "#{order_number}_#{service_kind.code}/#{date.year}"
  end

  def to_s
    number
  end
end

class Contract < ActiveRecord::Base
  include WithAttachments

  belongs_to :service_kind
  belongs_to :counterparty
  belongs_to :contact_person, class_name: 'User'

  validates :order_number, presence: true
  validates :service_kind, presence: true
  validates :date, presence: true
  validates :counterparty, presence: true

  def number
    "#{order_number}_#{service_kind.code}/#{date.year}"
  end

  def to_s
    number
  end
end

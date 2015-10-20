class Contract::Act < ActiveRecord::Base
  include ActRepository
  include WithAttachments

  belongs_to :document, polymorphic: true
  has_one :project, foreign_key: 'contract_act_id'

  validates :order_number, presence: true
  validates :date, presence: true
  validates :formulation, presence: true
  validates :sum, presence: true

  def to_s
    order_number.to_s
  end
end

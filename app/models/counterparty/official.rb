class Counterparty::Official < ActiveRecord::Base
  include OfficialRepository

  belongs_to :counterparty

  validates :full_name, presence: true
  validates :counterparty, presence: true

  def to_s
    full_name
  end
end

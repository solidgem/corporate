class Counterparty::Official < ActiveRecord::Base
  include OfficialRepository

  belongs_to :counterparty

  validates :name, presence: true
  validates :counterparty_id, presence: true

  def to_s
    name
  end
end

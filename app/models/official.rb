class Official < ActiveRecord::Base
  belongs_to :counterparty

  validates :name, presence: true

  def to_s
    name
  end
end

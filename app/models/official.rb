class Official < ActiveRecord::Base
  belongs_to :counterparty

  scope :ordered_by_name, -> { order :name }

  validates :name, presence: true

  def to_s
    name
  end
end

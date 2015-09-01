class Representative < ActiveRecord::Base
  belongs_to :contractor

  validates :name, presence: true

  def to_s
    name
  end
end

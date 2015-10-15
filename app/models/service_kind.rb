class ServiceKind < ActiveRecord::Base
  validates :code, presence: true
  validates :name, presence: true

  def to_s
    name
  end
end

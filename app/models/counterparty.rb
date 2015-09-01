class Counterparty < ActiveRecord::Base
  has_many :officials
  has_many :projects
  belongs_to :responsible_user, class_name: 'User'

  validates :title, presence: true

  def to_s
    title
  end
end

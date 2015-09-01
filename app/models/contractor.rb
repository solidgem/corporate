class Contractor < ActiveRecord::Base
  has_many :representatives
  has_many :projects
  belongs_to :responsible_user, class_name: 'User'

  validates :title, presence: true

  def to_s
    title
  end
end

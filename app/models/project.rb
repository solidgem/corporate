class Project < ActiveRecord::Base
  has_many :tasks
  belongs_to :responsible_user, class_name: 'User'

  include ProjectRepository

  validates :responsible_user, presence: true

  def to_s
    title
  end
end

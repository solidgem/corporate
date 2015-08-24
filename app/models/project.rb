class Project < ActiveRecord::Base
  include ProjectRepository

  has_many :tasks
  belongs_to :responsible_user, class_name: 'User'

  validates :responsible_user, presence: true

  def to_s
    title
  end
end

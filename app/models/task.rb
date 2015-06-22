class Task < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'

  has_many :task_participations
  has_many :users, through: :task_participations
  has_many :comments

  validates :title, presence: true
  validates :creator, presence: true

  def to_s
    title
  end
end

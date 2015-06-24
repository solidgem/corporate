class Task < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  belongs_to :responsible_user, class_name: 'User'

  has_many :task_participations
  has_many :users, through: :task_participations
  has_many :comments

  validates :title, presence: true
  validates :creator, presence: true
  validates :responsible_user, presence: true

  def creator_id=(v)
    super
    self.responsible_user_id ||= v
  end

  def to_s
    title
  end
end

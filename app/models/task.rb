class Task < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  belongs_to :responsible_user, class_name: 'User'

  has_many :task_participations
  has_many :users, through: :task_participations
  has_many :comments

  validates :title, presence: true
  validates :creator, presence: true
  validates :responsible_user, presence: true


  def to_s
    title
  end

  private

  def write_attribute(attr_name, value)
    self.responsible_user_id ||= value if attr_name == 'creator_id'
    super
  end
end

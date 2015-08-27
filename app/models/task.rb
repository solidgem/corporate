class Task < ActiveRecord::Base
  extend Enumerize
  include WithAttachments
  include TaskRepository

  belongs_to :project
  belongs_to :creator, class_name: 'User'
  belongs_to :responsible_user, class_name: 'User'

  has_many :task_participations, dependent: :destroy
  has_many :users, through: :task_participations
  has_many :comments

  enumerize :competence, in: %w[html_coding programming content design]

  state_machine :status, initial: :active do
    event :activate do
      transition [:finished, :archived] => :active
    end

    event :finish do
      transition :active => :finished
    end

    event :archive do
      transition [:active, :finished] => :archived
    end
  end

  validates :title, presence: true
  validates :creator, presence: true
  validates :responsible_user, presence: true
  validates :competence, presence: true

  def member?(user)
    return true if creator == user
    return true if responsible_user == user
    return true if users.include? user
    false
  end

  def to_s
    title
  end
  
  private

  def write_attribute(attr_name, value)
    self.responsible_user_id ||= value if attr_name == 'creator_id'
    super
  end
end

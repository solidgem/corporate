class User < ActiveRecord::Base
  ROLES = %w[top_manager manager worker].freeze

  extend Enumerize

  has_secure_password

  belongs_to :inviter, class_name: 'User'

  has_many :created_tasks, class_name: 'Task', foreign_key: :creator_id
  has_many :task_participations, dependent: :destroy
  has_many :tasks, through: :task_participations

  validates :email, email: true, uniqueness: true
  validates :name, presence: true

  enumerize :role, in: ROLES, predicates: true, default: :worker

  def guest?
    false
  end

  def to_s
    name
  end
end

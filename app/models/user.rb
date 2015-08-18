class User < ActiveRecord::Base
  extend Enumerize

  has_secure_password

  enumerize :role, in: %w[administrator manager worker], predicates: true, default: :worker
  mount_uploader :avatar, AvatarUploader

  belongs_to :inviter, class_name: 'User'

  has_many :created_tasks, class_name: 'Task', foreign_key: :creator_id
  has_many :task_participations, dependent: :destroy
  has_many :tasks, through: :task_participations

  validates :email, email: true, uniqueness: true
  validates :name, presence: true

  with_options if: :worker? do |worker|
    worker.validates :hour_rate, numericality: { greater_than: 0 }
    worker.validates :external_hour_rate, numericality: { greater_than: 0 }
  end

  validates :external_hour_rate, numericality: { greater_than_or_equal_to: :hour_rate }

  def guest?
    false
  end

  def to_s
    name
  end
end

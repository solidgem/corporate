class User < ActiveRecord::Base
  has_secure_password

  belongs_to :inviter, class_name: 'User'

  has_many :created_tasks, class_name: 'Task', foreign_key: :creator_id

  validates :email, email: true, uniqueness: true

  def to_s
    email
  end
end

class User < ActiveRecord::Base
  has_secure_password

  belongs_to :inviter, class_name: 'User'

  validates :email, email: true, uniqueness: true

  def to_s
    email
  end
end

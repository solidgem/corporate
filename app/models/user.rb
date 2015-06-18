class User < ActiveRecord::Base
  has_secure_password

  validates :email, email: true
end

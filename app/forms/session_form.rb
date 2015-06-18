class SessionForm < BaseForm
  attribute :email
  attribute :password

  validates :email, email: true
  validates :password, presence: true

  validate do
    errors.add(:base, :wrong_email_or_password) unless user.try(:authenticate, password)
  end

  def user
    @user ||= User.find_by email: email
  end
end

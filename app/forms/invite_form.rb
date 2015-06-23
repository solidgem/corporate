class InviteForm < BaseForm
  attribute :email

  validates :email, email: true

  validate do
    errors.add(:email, :already_invited) if User.exists? email: email
  end
end

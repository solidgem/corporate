class InviteForm < BaseForm
  attribute :email
  attribute :role

  validates :email, email: true
  validates :role, inclusion: { in: User::ROLES }

  validate do
    errors.add(:email, :already_invited) if User.exists? email: email
  end
end

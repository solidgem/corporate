class InviteForm < BaseForm
  extend Enumerize

  attribute :name
  attribute :email
  attribute :role

  enumerize :role, in: User::ROLES, default: :worker, i18n_scope: 'enumerize.user.role'

  validates :name, presence: true
  validates :email, presence: true, email: true
  validates :role, presence: true

  validate do
    errors.add(:email, :already_invited) if User.exists? email: email
  end
end

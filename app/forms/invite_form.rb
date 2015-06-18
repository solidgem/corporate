class InviteForm < BaseForm
  attribute :email

  validates :email, email: true
end

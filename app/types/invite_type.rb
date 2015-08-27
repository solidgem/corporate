class InviteType < User
  include BaseType

  after_initialize :generate_password, if: :new_record?

  validates :role, inclusion: { in: :available_roles }
  validates :inviter, presence: true

  def policy
    InvitePolicy.new(inviter, self)
  end

  def available_roles
    policy.available_roles
  end

  def available_role_options
    User.role.options.select{ |option| option.last.in? available_roles }
  end

  private

  def generate_password
    self.password = SecureRandom.urlsafe_base64(6)
  end
end

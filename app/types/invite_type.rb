class InviteType < User
  include BaseType

  validates :role, inclusion: { in: :available_roles }
  validates :inviter, presence: true

  def initialize(attrs)
    super(attrs)
    self.password = SecureRandom.urlsafe_base64(6)
  end

  def policy
    InvitePolicy.new(inviter, self)
  end

  def available_roles
    policy.available_roles
  end

  def available_role_options
    User.role.options.select{ |option| option.last.in? available_roles }
  end
end

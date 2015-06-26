class Guest
  def self.policy_class
    UserPolicy
  end

  User::ROLES.each do |role|
    define_method "#{role}?" do
      false
    end
  end

  def guest?
    true
  end

  def to_s
    'Guest'
  end
end

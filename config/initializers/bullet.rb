if Rails.env.development? || Rails.env.test?
  Bullet.enable = true
  Bullet.alert = true
  Bullet.bullet_logger = true
  Bullet.console = true
  Bullet.rails_logger = true
  Bullet.add_whitelist type: :n_plus_one_query, class_name: 'Contract::SupplementaryAgreement', association: :contract
  Bullet.add_whitelist type: :n_plus_one_query, class_name: 'Contract::Appendix', association: :contract
end

if Rails.env.test?
  Bullet.raise = true
end

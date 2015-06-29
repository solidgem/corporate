FactoryGirl.define do
  factory :invite_form do
    name
    email
    role User::ROLES.first
  end
end
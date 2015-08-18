FactoryGirl.define do
  factory :user do
    name
    email
    avatar
    password
    hour_rate 250
    external_hour_rate 500
  end

  factory :administrator, parent: :user do
    role :administrator
  end
end

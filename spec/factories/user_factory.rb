FactoryGirl.define do
  factory :user do
    name
    email
    profile_image { generate :photo }
    password
    hour_rate 250
    external_hour_rate 500
  end

  factory :administrator, parent: :user do
    role :administrator
  end
  factory :manager, parent: :user do
    role :manager
  end
end

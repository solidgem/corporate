FactoryGirl.define do
  factory :user do
    name
    email
    avatar
    password
    hour_rate 250
    external_hour_rate 500
  end

  factory :top_manager, parent: :user do
    role :top_manager
  end
end

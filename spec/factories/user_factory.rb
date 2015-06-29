FactoryGirl.define do
  factory :user do
    name
    email
    password
  end

  factory :top_manager, parent: :user do
    role :top_manager
  end
end

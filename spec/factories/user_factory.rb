FactoryGirl.define do
  factory :user do
    email
    password
  end

  factory :top_manager, parent: :user do
    role :top_manager
  end
end

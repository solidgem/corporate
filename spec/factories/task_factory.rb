FactoryGirl.define do
  factory :task do
    title
    description
    association :creator, factory: :user
    association :responsible_user, factory: :user
  end
end

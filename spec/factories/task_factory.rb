FactoryGirl.define do
  factory :task do
    title
    description
    association :creator, factory: :user
  end
end

FactoryGirl.define do
  factory :representative do
    name
    association :contractor, factory: :contractor
  end
end

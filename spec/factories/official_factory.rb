FactoryGirl.define do
  factory :official do
    name
    association :counterparty, factory: :counterparty
  end
end

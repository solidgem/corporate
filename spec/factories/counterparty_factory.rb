FactoryGirl.define do
  factory :counterparty do
    title
    site { generate :url }
  end
end

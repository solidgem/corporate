FactoryGirl.define do
  factory :service_kind do
    code { generate :string }
    name { generate :string }
  end
end

FactoryGirl.define do
  factory :project do
    title
    cost { generate :integer }
  end
end

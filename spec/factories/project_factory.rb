FactoryGirl.define do
  factory :project do
    title
    cost { generate :integer }
    responsible_user_id { create(:user).id }
  end
end

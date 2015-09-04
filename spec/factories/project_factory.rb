FactoryGirl.define do
  factory :project do
    title
    deadline { generate :datetime }
    cost { generate :integer }
    responsible_user_id { create(:user).id }
  end
end

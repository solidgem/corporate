FactoryGirl.define do
  factory :project do
    title
    deadline { generate :datetime }
    cost { generate :integer }
    responsible_user_id { create(:user).id }
    counterparty_id { create(:counterparty).id }
  end
end

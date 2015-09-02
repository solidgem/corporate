FactoryGirl.define do
  factory :task do
    title
    description
    association :creator, factory: :user
    responsible_user_id { create(:user).id }
    competence { Task.competence.values.sample }
  end
end

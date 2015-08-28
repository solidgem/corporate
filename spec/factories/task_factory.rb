FactoryGirl.define do
  factory :task do
    title
    description
    association :creator, factory: :user
    competence { Task.competence.values.sample }
  end
end

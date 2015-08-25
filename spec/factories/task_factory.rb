FactoryGirl.define do
  factory :task do
    title
    description
    association :creator, factory: :administrator
    competence { Task.competence.values.sample }
  end
end

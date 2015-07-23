FactoryGirl.define do
  factory 'task/comment' do
    content
    task
    user
    elapsed_time { generate :int }
  end
end

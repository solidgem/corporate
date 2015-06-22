class Task::Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

  validates :task, presence: true
  validates :user, presence: true
  validates :content, presence: true
end

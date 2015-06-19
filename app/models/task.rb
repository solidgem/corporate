class Task < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'

  validates :title, presence: true
  validates :creator, presence: true

  def to_s
    title
  end
end

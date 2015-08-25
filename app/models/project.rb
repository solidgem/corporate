class Project < ActiveRecord::Base
  has_many :tasks
  belongs_to :responsible_user, class_name: 'User'

  validates :responsible_user, presence: true

  state_machine :status, initial: :active do
    event :activate do
      transition :finished => :active
    end

    event :finish do
      transition :active => :finished
    end
  end
  def to_s
    title
  end
end

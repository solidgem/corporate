class Project < ActiveRecord::Base
  extend Enumerize
  include ProjectRepository

  has_many :tasks
  belongs_to :responsible_user, class_name: 'User'
  belongs_to :counterparty

  enumerize :kind, in: %w[development support], default: :development

  validates :title, presence: true
  validates :responsible_user, presence: true
  validates :deadline, presence: true
  validates :kind, presence: true

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

class Project < ActiveRecord::Base
  extend Enumerize
  include ProjectRepository

  has_many :tasks
  belongs_to :responsible_user, class_name: 'User'
  belongs_to :counterparty

  enumerize :kind, in: %w[development support], default: :development
  enumerize :overdue_kind, in: %w[company_fault customer_fault]

  validates :title, presence: true
  validates :responsible_user, presence: true
  validates :deadline, presence: true
  validates :kind, presence: true

  state_machine :status, initial: :active do
    before_transition any => :active do |project, _transition|
      project.finished_at = nil
      project.overdue_kind = nil
    end

    event :activate do
      transition :finished => :active
    end

    event :finish do
      transition :active => :finished
    end

    state :finished do
      validates :finished_at, presence: true
      validates :overdue_kind, presence: true, if: :overdue?
      validates :overdue_kind, absence: true, unless: :overdue?
    end
  end

  def overdue?
    finished_at && finished_at > deadline
  end

  def to_s
    title
  end
end

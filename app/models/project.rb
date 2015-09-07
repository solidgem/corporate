class Project < ActiveRecord::Base
  extend Enumerize
  include ProjectRepository

  has_many :tasks
  belongs_to :responsible_user, class_name: 'User'

  enumerize :kind, in: %w[support development]
  enumerize :overdue_kind, in: %w[company_fault customer_fault]

  validates :title, presence: true
  validates :responsible_user, presence: true
  validates :deadline, presence: true

  state_machine :status, initial: :active do
    event :activate do
      transition :finished => :active
    end

    event :finish do
      transition :active => :finished
    end
    state :finished do
      validates :finish_date, presence: true
      validate :validate_dates
    end
  end

  def validate_dates
    return if finish_date.blank?
    errors.add(:overdue_kind, :overdue_type_must_be_set) if finish_date > deadline && overdue_kind.blank?
  end

  def to_s
    title
  end
end

class Task::Comment < ActiveRecord::Base
  include WithAttachments
  include CommentRepository

  belongs_to :user
  belongs_to :task, touch: true

  counter_culture :task, column_name: 'total_elapsed_time', delta_column: 'elapsed_time'

  validates :task, presence: true
  validates :user, presence: true
  validates :content, presence: true

  def elapsed_time_hours
    TimeConverter.convert_to_time(elapsed_time.to_i)[:hours]
  end

  def elapsed_time_hours=(v)
    update_elapsed_time v.to_i, elapsed_time_minutes
  end

  def elapsed_time_minutes
    TimeConverter.convert_to_time(elapsed_time.to_i)[:minutes]
  end

  def elapsed_time_minutes=(v)
    update_elapsed_time elapsed_time_hours, v.to_i
  end

  private

  def update_elapsed_time(hours, minutes)
    self.elapsed_time = TimeConverter.convert_to_seconds(hours: hours, minutes: minutes)
  end
end

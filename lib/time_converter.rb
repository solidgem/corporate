module TimeConverter
  extend self

  def convert_to_time(seconds)
    { hours: seconds / 1.hour, minutes: seconds % 1.hour / 1.minute }
  end

  def convert_to_seconds(time)
    time[:hours] * 1.hour + time[:minutes] * 1.minute
  end
end

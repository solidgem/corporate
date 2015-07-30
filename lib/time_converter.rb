module TimeConverter

  extend self

  def convert_to_time(seconds)
    { hours: seconds / 1.hour, minutes: seconds % 1.hour / 1.minute }
  end

  def convert_to_string(seconds)
    time = convert_to_time seconds
    I18n.with_options scope: 'datetime.dotiw' do |locale|
      arr = time.each_with_object([]){|(key, value), arr| arr << "#{locale.t key, count: time[key]}" if value != 0}
      arr.join(' ')
    end
  end

  def convert_to_seconds(time)
    time[:hours] * 1.hour + time[:minutes] * 1.minute
  end
end

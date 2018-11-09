module UserWorkingOutQuery
  module_function

  def perform(user, start_date, end_date)
    return [] if start_date.nil?
    return [] if end_date.nil?

    groups = Task::Comment.where(user: user)
               .more_or_equal(date: start_date.to_date)
               .less_than(date: end_date.to_date)
               .group(:date).sum(:elapsed_time)

    return [] if groups.empty?
    (start_date.to_date..end_date.to_date).map do |date|
      [date, groups[date] || 0]
    end
  end
end

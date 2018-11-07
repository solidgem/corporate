module UserStatisticsHelper
  def last_months(n)
    current_month = Date.current.beginning_of_month
    n.times.reverse_each.map do |i|
      current_month.months_ago(i)
    end
  end

  def user_statistics_draw_months(filter_form)
    links = last_months(4).map do |month_date|
      month_begin = month_date
      month_end = month_date.next_month

      link_class = %w[btn]
      if month_begin == filter_form.start_date && month_end == filter_form.end_date
        link_class << 'btn-primary'
      else
        link_class << 'btn-default'
      end

      link_to url_for(user_date_form: {
                          start_date: month_begin,
                          end_date: month_end}),
              class: link_class do
        t(:standalone_month_names)[month_date.month]
      end
    end
    links.join('&nbsp').html_safe
  end
end

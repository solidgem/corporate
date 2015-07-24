module ApplicationHelper
  def menu_item(model, action, name, url, link_options = {})
    return unless policy(model).send "#{action}?"
    content_tag :li do
      link_to name, url, link_options
    end
  end

  def markdown(text)
    find_and_preserve sanitize GitHub::Markdown.render_gfm(text)
  end

  def formatted_date(date)
    return unless date
    if date.year == Date.today.year
      l date, format: :short
    else
      l date, format: :long
    end
  end

  def last_months(n)
    current_month = DateTime.current.beginning_of_month
    n.times.reverse_each.map do |i|
      current_month.months_ago(i)
    end
  end
end

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

  def render_breadcrumbs
    return if breadcrumbs.blank? || breadcrumbs.one?
    items = breadcrumbs.map do |breadcrumb|
      title, url = breadcrumb.values_at :title, :url

      item_class = []
      item_class << :active if breadcrumb == breadcrumbs.last

      content_tag :li, class: item_class do
        if url
          link_to title, url
        else
          title
        end
      end
    end

    content_tag :ul, class: :breadcrumb do
      items.join.html_safe
    end
  end

  def show_attribute(model, attribute)
    value = model.send(attribute)
    return if value.blank?
    concat content_tag :dt, han(model.model_name, attribute)
    concat content_tag :dd, value
    nil
  end

  def show_attribute_in_list_group(model, attribute)
    value = model.send(attribute)
    return if value.blank?
    res = content_tag :li, class: 'list-group-item' do
      [
          content_tag(:strong, han(model.model_name, attribute)),
          value
      ].join(' ').html_safe
    end
    res.html_safe
  end

  def present(model)
    klass = "#{model.class}Presenter".constantize
    presenter = klass.new(model, self)
    yield(presenter) if block_given?
    presenter
  end

  def convert_seconds_to_string(seconds)
    time = TimeConverter.convert_to_time seconds
    I18n.with_options scope: 'datetime.distance_in_words' do |i18n|
      arr = []
      arr << i18n.t(:x_hours, count: time[:hours]) if time[:hours] != 0
      arr << i18n.t(:x_minutes, count: time[:minutes]) if time[:minutes] != 0
      arr.join(' ')
    end
  end

  def readable_tag(tag, model_name, attribute_name, &block)
    return if policy(model_name).readable_attributes.exclude? attribute_name
    content_tag tag, capture(&block)
  end


  # TODO: made fork
  def attachment_image_tag(record, name, *args, fallback: nil, format: nil, host: nil, **options)
    file = record.send(name)
    # classes = ["attachment", record.class.model_name.singular, name, *options[:class]]
    classes = ["attachment", record.model_name.singular, name, *options[:class]]

    if file
      image_tag(attachment_url(record, name, *args, format: format, host: host), options.merge(class: classes))
    elsif fallback
      classes << "fallback"
      image_tag(fallback, options.merge(class: classes))
    end
  end
end

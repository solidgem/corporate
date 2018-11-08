class Task::CommentPresenter < BasePresenter
  def content
    h.markdown model.content
  end

  def created_at
    h.formatted_date model.created_at
  end

  def date
    h.formatted_date model.date
  end

  def updated_at
    h.formatted_date model.updated_at
  end

  def elapsed_time
    return if model.elapsed_time.zero?
    h.convert_seconds_to_string model.elapsed_time
  end
end

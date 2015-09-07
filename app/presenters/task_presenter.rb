class TaskPresenter < BasePresenter
  def to_link
    h.link_to model.to_s, model
  end

  def description
    h.markdown model.description
  end

  def deadline
    h.formatted_date model.deadline
  end

  def total_elapsed_time
    return if model.total_elapsed_time.zero?
    h.convert_seconds_to_string model.total_elapsed_time
  end

  def access_data
    h.markdown model.access_data
  end

  def status
    model.human_status_name
  end

  def created_at
    h.formatted_date model.created_at
  end

  def updated_at
    h.formatted_date model.updated_at
  end

  def responsible_user
    h.present model.responsible_user
  end

  def users
    model.users.map { |user| h.present user }
  end

  def comments
    model.comments.ordered.map { |comment| h.present comment }
  end
end

class TaskPresenter < BasePresenter
  def responsible_user
    h.present model.responsible_user
  end

  def users
    model.users.map { |user| h.present user }
  end

  def deadline
    h.formatted_date model.deadline
  end

  def total_elapsed_time
    return if model.total_elapsed_time.zero?
    h.convert_seconds_to_string model.total_elapsed_time
  end

  def title
    h.link_to model.title, model
  end

  def description
    h.markdown model.description
  end

  def access_data
    h.markdown model.access_data
  end

  def created_at
    h.formatted_date model.created_at
  end

  def updated_at
    h.formatted_date model.updated_at
  end
end

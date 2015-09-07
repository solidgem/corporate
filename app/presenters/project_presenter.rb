class ProjectPresenter < BasePresenter
  def initialize(model, view_context)
    access_presenter = AccessPresenter.new model, view_context
    super access_presenter, view_context
  end

  def title
    h.link_to_if h.policy(model).show?, model.title, model
  end

  def updated_at
    h.formatted_date model.updated_at
  end

  def deadline
    h.formatted_date model.deadline
  end

  def kind
    model.kind_text
  end

  def total_balance(total_expenses)
    return unless model.cost
    (model.cost - total_expenses).to_s(:currency)
  end

  def cost
    return unless model.cost
    model.cost.to_s(:currency)
  end

  def status
    model.human_status_name
  end

  def responsible_user
    h.present model.responsible_user
  end

  def finish_date
    h.formatted_date model.finish_date
  end

  def overdue_kind
    model.overdue_kind_text
  end
end

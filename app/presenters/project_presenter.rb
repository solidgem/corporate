class ProjectPresenter < BasePresenter
  def initialize(model, view_context)
    access_presenter = AccessPresenter.new model, view_context
    super access_presenter, view_context
  end

  def to_link
    h.link_to_if h.policy(model).show?, model.to_s, model
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

  def access_data
    h.markdown model.access_data
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

  def finished_at
    h.formatted_date model.finished_at
  end

  def overdue_kind
    model.overdue_kind_text
  end

  def letters_of_thanks
    return unless model.letters_of_thanks
    I18n.translate(model.letters_of_thanks.to_s)
  end

  def complaints
    return if model.complaints.nil? || model.complaints.zero?
    model.complaints
  end

  def critical_complaints
    return if model.critical_complaints.nil? || model.critical_complaints.zero?
    model.critical_complaints
  end

  def counterparty
    h.present model.counterparty
  end

  def contract_act
    h.present model.contract_act
  end
end

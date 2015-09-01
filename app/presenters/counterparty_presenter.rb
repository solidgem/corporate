class CounterpartyPresenter < BasePresenter
  def initialize(model, view_context)
    access_presenter = AccessPresenter.new model, view_context
    super access_presenter, view_context
  end

  def title
    h.link_to_if h.policy(model).show?, model.title, model
  end

  def requisites
    h.markdown model.requisites
  end

  def contacts
    h.markdown model.contacts
  end

  def agreements
    h.markdown model.agreements
  end

  def comment
    h.markdown model.comment
  end

  def responsible_user
    h.link_to_if h.policy(model).show?, model.responsible_user, model.responsible_user
  end
end

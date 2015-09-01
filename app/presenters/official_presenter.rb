class OfficialPresenter < BasePresenter
  def initialize(model, view_context)
    access_presenter = AccessPresenter.new model, view_context
    super access_presenter, view_context
  end

  def name
    h.link_to_if h.policy(model).show?, model.name, model
  end

  def contacts
    h.markdown model.contacts
  end
end

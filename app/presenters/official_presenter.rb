class OfficialPresenter < BasePresenter
  def name
    h.link_to_if h.policy(model).show?, model.name, model
  end

  def contacts
    h.markdown model.contacts
  end
end

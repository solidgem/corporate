class CounterpartyPresenter < BasePresenter
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

  def site
    h.link_to_if model.site.present?, model.site, model.site
  end

  def responsible_user_link
    h.link_to_if h.policy(model).show?, model.responsible_user, model.responsible_user
  end
end

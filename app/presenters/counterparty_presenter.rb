class CounterpartyPresenter < BasePresenter
  def to_link
    h.link_to_if h.policy(model).show?, model.to_s, model
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
    return if model.site.blank?
    h.link model.site, model.site
  end

  def responsible_user
    h.present model.responsible_user
  end
end

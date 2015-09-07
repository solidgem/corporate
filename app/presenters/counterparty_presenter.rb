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
    h.link_to_if model.site.present?, model.site, model.site
  end

  def responsible_user_link
    return unless model.responsible_user.present?
    h.link_to_if h.policy(model.responsible_user).show?, model.responsible_user, model.responsible_user
  end
end

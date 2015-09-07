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
    h.link_to model.site, model.site
  end

  def responsible_user
    h.present model.responsible_user
  end

  def officials_web
    model.officials.web.map{ |model| h.present model }
  end

  def projects_web
    model.projects.web.map{ |model| h.present model }
  end
end

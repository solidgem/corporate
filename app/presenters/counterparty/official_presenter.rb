class Counterparty::OfficialPresenter < BasePresenter
  def counterparty
    h.present model.counterparty
  end

  def contacts
    h.markdown model.contacts
  end

  def to_link
    h.link_to model, [model.counterparty, model]
  end
end

class Counterparty::OfficialPresenter < BasePresenter
  def counterparty_link
    h.link_to model.counterparty.to_s, model.counterparty
  end
end

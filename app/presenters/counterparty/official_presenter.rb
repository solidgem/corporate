class Counterparty::OfficialPresenter < BasePresenter
  def counterparty
    h.present model.counterparty
  end
end

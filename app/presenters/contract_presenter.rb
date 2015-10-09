class ContractPresenter < BasePresenter
  def to_link
    h.link_to model.to_s, model
  end

  def service_kind
    h.present model.service_kind
  end

  def contact_person
    h.present model.contact_person
  end

  def counterparty
    h.present model.counterparty
  end

  def have_original
    h.t model.have_original.to_s
  end
end

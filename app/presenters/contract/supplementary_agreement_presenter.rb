class Contract::SupplementaryAgreementPresenter < BasePresenter
  def to_link
    h.link_to model.to_s, [model.contract, model]
  end

  def contact_person
    h.present model.contact_person
  end

  def have_original
    h.t model.have_original.to_s
  end
end

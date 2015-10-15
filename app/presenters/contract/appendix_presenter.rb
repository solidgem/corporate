class Contract::AppendixPresenter < BasePresenter
  def contact_person
    h.present model.contact_person
  end

  def have_original
    h.t model.have_original.to_s
  end
end

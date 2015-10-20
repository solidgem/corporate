class Contract::ActPresenter < BasePresenter
  def project
    h.present model.project
  end
end

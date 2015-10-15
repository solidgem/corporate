class Web::Contracts::SupplementaryAgreementsController < Web::Contracts::ApplicationController
  add_breadcrumb {{ url: contract_supplementary_agreements_path(resource_contract) }}

  def index
    skip_policy_scope
    authorize :'contract/supplementary_agreement'
    @q = resource_contract.supplementary_agreements.web.search(params[:q])
    @supplementary_agreements = @q.result.page(params[:page])
    respond_with @supplementary_agreements
  end

  def new
    @supplementary_agreement = resource_contract.supplementary_agreements.build
    authorize @supplementary_agreement
    add_breadcrumb
  end

  def create
    @supplementary_agreement = resource_contract.supplementary_agreements.build
    authorize resource_contract
    add_breadcrumb
    @supplementary_agreement.update supplementary_params
    respond_with @supplementary_agreement, location: resource_contract
  end

  def edit
    @supplementary_agreement = resource_contract.supplementary_agreements.find(params[:id])
    authorize resource_contract
    add_breadcrumb model: @supplementary_agreement
    respond_with @supplementary_agreement
  end

  def update
    @supplementary_agreement = resource_contract.supplementary_agreements.find(params[:id])
    authorize resource_contract
    add_breadcrumb model: @supplementary_agreement
    @supplementary_agreement.update supplementary_params
    respond_with resource_contract, @supplementary_agreement
  end

  private

  def supplementary_params
    params.require(:supplementary_agreement).permit(:order_number, :date,
                                                    :contact_person_id, :have_original,
                                                    attachments_files: [], attachments_attributes: [:id, :_destroy])
  end
end

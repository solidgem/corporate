class Web::Contracts::AppendixesController < Web::Contracts::ApplicationController
  add_breadcrumb {{ url: contract_appendixes_path(resource_contract) }}

  def index
    skip_policy_scope
    authorize :'contract/appendix'
    @q = resource_contract.appendixes.web.search(params[:q])
    @appendixes = @q.result.page(params[:page])
    respond_with @appendixes
  end

  def new
    @appendix = resource_contract.appendixes.build
    authorize @appendix
    add_breadcrumb
  end

  def create
    @appendix = resource_contract.appendixes.build
    authorize resource_contract
    add_breadcrumb
    @appendix.update supplementary_params
    respond_with @appendix, location: resource_contract
  end

  def edit
    @appendix = resource_contract.appendixes.find(params[:id])
    authorize resource_contract
    add_breadcrumb model: @appendix
    respond_with @appendix, location: resource_contract
  end

  def update
    @appendix = resource_contract.appendixes.find(params[:id])
    authorize resource_contract
    add_breadcrumb model: @appendix
    @appendix.update supplementary_params
    respond_with @appendix, location: resource_contract
  end

  private

  def supplementary_params
    params.require(:appendix).permit(:order_number, :date,
                                                    :contact_person_id, :have_original,
                                                    attachments_files: [], attachments_attributes: [:id, :_destroy])
  end
end

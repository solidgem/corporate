class Web::ContractsController < Web::ApplicationController
  add_breadcrumb {{ url: contracts_path }}

  def index
    skip_policy_scope
    authorize :contract
    @q = Contract.web.search(params[:q])
    @contracts = @q.result.page(params[:page])
    respond_with @contracts
  end

  def show
    @contract = Contract.find(params[:id])
    authorize @contract
    add_breadcrumb model: @contract
    respond_with @contract
  end

  def edit
    @contract = Contract.find params[:id]
    authorize @contract
    add_breadcrumb model: @contract
    respond_with @contract
  end

  def new
    @contract = Contract.new
    authorize @contract
    add_breadcrumb
    respond_with @contract
  end

  def create
    @contract = Contract.new
    authorize @contract
    add_breadcrumb
    @contract.update contract_params
    respond_with @contract
  end

  def update
    @contract = Contract.find params[:id]
    authorize @contract
    add_breadcrumb model: @contract
    @contract.update contract_params
    respond_with @contract
  end

  private

  def contract_params
    params.require(:contract).permit(:order_number, :service_kind_id, :date, :counterparty_id,
                                     :contact_person_id, :have_original,
                                     attachments_files: [], attachments_attributes: [:id, :_destroy])
  end
end

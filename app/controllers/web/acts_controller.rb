class Web::ActsController < Web::ApplicationController
  helper_method :resource_document

  before_action do
    setup_breadcrumbs
  end

  def index
    authorize resource_document.acts
    skip_policy_scope
    add_breadcrumb
    @q = resource_document.acts.web.search(params[:q])
    @acts = @q.result.page(params[:page])
    respond_with @acts
  end

  def new
    @act = resource_document.acts.build
    authorize @act
    add_breadcrumb
    respond_with @act
  end

  def create
    @act = resource_document.acts.build
    authorize @act
    @act.update act_params
    add_breadcrumb
    respond_with @act, location: [resource_document, :acts]
  end

  def edit
    @act = resource_document.acts.find(params[:id])
    authorize @act
    add_breadcrumb model: @act
    respond_with @act
  end

  def update
    @act = resource_document.acts.find(params[:id])
    authorize @act
    @act.update act_params
    add_breadcrumb model: @act
    respond_with @act, location: [resource_document, :acts]
  end

private

  def setup_breadcrumbs
    breadcrumbs_for_add = send("#{resource_document.model_name.singular_route_key}_breadcrumbs")
    breadcrumbs.push *breadcrumbs_for_add
  end

  def contract_breadcrumbs
    [
        { title: t(:contracts), url: :contracts },
        { title: resource_document, url: resource_document },
    ]
  end

  def supplementary_agreement_breadcrumbs
    [
        { title: t(:contracts), url: :contracts },
        { title: resource_document.contract, url: resource_document.contract },
        { title: t(:supplementary_agreements), url: [resource_document.contract, :supplementary_agreements] },
        { title: resource_document },
    ]
  end

  def act_params
    params.require(:act).permit(:order_number, :date, :project_id, :sum, :formulation,
                                attachments_files: [], attachments_attributes: [:id, :_destroy])
  end

  def resource_document
    @resource_document ||= begin
      klass = params[:document_type].constantize
      id_key = params[:document_id_key]
      id = params[id_key]
      klass.find(id)
    end
  end
end
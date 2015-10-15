class Web::ServiceKindsController < Web::ApplicationController
  add_breadcrumb {{ url: service_kinds_path }}

  def index
    skip_policy_scope
    authorize :service_kind
    @q = ServiceKind.search(params[:q])
    @service_kinds = @q.result.page(params[:page])
    respond_with @service_kinds
  end

  def edit
    @service_kind = ServiceKind.find params[:id]
    authorize @service_kind
    add_breadcrumb model: @service_kind
    respond_with @service_kind
  end

  def new
    @service_kind = ServiceKind.new
    authorize @service_kind
    add_breadcrumb
    respond_with @service_kind
  end

  def create
    @service_kind = ServiceKind.new
    authorize @service_kind
    add_breadcrumb
    @service_kind.update service_kind_params
    redirect_to service_kinds_path
  end

  def update
    @service_kind = ServiceKind.find params[:id]
    authorize @service_kind
    add_breadcrumb model: @service_kind
    @service_kind.update service_kind_params
    redirect_to service_kinds_path
  end

  private

  def service_kind_params
    params.require(:service_kind).permit(:code, :name)
  end
end

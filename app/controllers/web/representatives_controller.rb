class Web::RepresentativesController < Web::ApplicationController
  add_breadcrumb {{ url: representatives_path }}

  def index
    skip_policy_scope
    authorize :representative
    @q = policy_scope(Representative).search(params[:q])
    @q.sorts = 'id desc' if @q.sorts.empty?
    @representatives = @q.result.page(params[:page])
    respond_with @representatives
  end

  def show
    @representative = Representative.find(params[:id])
    authorize @representative
    add_breadcrumb model: @representative
  end

  def new
    authorize :representative
    @representative = Representative.new
  end

  def create
    @representative = Representative.new
    authorize @representative
    add_breadcrumb
    @representative.update representative_params
    respond_with @representative
  end

  def edit
    @representative = Representative.find params[:id]
    authorize @representative
    add_breadcrumb model: @representative
    respond_with @representative
  end

  def update
    @representative = Representative.find params[:id]
    authorize @representative
    add_breadcrumb model: @representative
    @representative.update representative_params
    respond_with @representative
  end

  def representative_params
    params.require(:representative).permit(:name, :position, :contractor_id, :contacts)
  end
end

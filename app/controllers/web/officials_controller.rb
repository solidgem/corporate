class Web::RepresentativesController < Web::ApplicationController
  add_breadcrumb {{ url: officials_path }}

  def index
    skip_policy_scope
    authorize :official
    @q = policy_scope(Official).search(params[:q])
    @q.sorts = 'id desc' if @q.sorts.empty?
    @officials = @q.result.page(params[:page])
    respond_with @officials
  end

  def show
    @official = Official.find(params[:id])
    authorize @official
    add_breadcrumb model: @official
  end

  def new
    authorize :official
    @official = Official.new
  end

  def create
    @official = Official.new
    authorize @official
    add_breadcrumb
    @official.update official_params
    respond_with @official
  end

  def edit
    @official = Official.find params[:id]
    authorize @official
    add_breadcrumb model: @official
    respond_with @official
  end

  def update
    @official = Official.find params[:id]
    authorize @official
    add_breadcrumb model: @official
    @official.update official_params
    respond_with @official
  end

  def official_params
    params.require(:official).permit(:name, :position, :contractor_id, :contacts)
  end
end

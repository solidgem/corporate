class Web::ContractorsController < Web::ApplicationController
  add_breadcrumb {{ url: contractors_path }}

  def index
    skip_policy_scope
    authorize :contractor
    @q = policy_scope(Contractor).search(params[:q])
    @q.sorts = 'id desc' if @q.sorts.empty?
    @contractors = @q.result.page(params[:page])
    respond_with @contractors
  end

  def show
    @contractor = Contractor.find(params[:id])
    authorize @contractor
    add_breadcrumb model: @contractor
    @projects = @contractor.projects.order(:title)
    @representatives = @contractor.representatives.order(:name)
  end

  def new
    authorize :contractor
    @contractor = Contractor.new
    add_breadcrumb
  end

  def create
    @contractor = Contractor.new
    authorize @contractor
    add_breadcrumb
    @contractor.update contractor_params
    respond_with @contractor
  end

  def edit
    @contractor = Contractor.find params[:id]
    authorize @contractor
    add_breadcrumb model: @contractor
    respond_with @contractor
  end

  def update
    @contractor = Contractor.find params[:id]
    authorize @contractor
    add_breadcrumb model: @contractor
    @contractor.update contractor_params
    respond_with @contractor
  end

  def contractor_params
    params.require(:contractor).permit(:title, :requisites, :contacts, :agreements, :site, :comment, :responsible_user_id)
  end
end

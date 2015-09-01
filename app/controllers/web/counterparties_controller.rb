class Web::CounterpartiesController < Web::ApplicationController
  add_breadcrumb {{ url: counterparties_path }}

  def index
    skip_policy_scope
    authorize :counterparty
    @q = policy_scope(Counterparty).search(params[:q])
    @q.sorts = 'id desc' if @q.sorts.empty?
    @counterparties = @q.result.page(params[:page])
    respond_with @counterparties
  end

  def show
    @counterparty = Counterparty.find(params[:id])
    authorize @counterparty
    add_breadcrumb model: @counterparty
  end

  def new
    authorize :counterparty
    @counterparty = Counterparty.new
    add_breadcrumb
  end

  def create
    @counterparty = Counterparty.new
    authorize @counterparty
    add_breadcrumb
    @counterparty.update counterparty_params
    respond_with @counterparty
  end

  def edit
    @counterparty = Counterparty.find params[:id]
    authorize @counterparty
    add_breadcrumb model: @counterparty
    respond_with @counterparty
  end

  def update
    @counterparty = Counterparty.find params[:id]
    authorize @counterparty
    add_breadcrumb model: @counterparty
    @counterparty.update counterparty_params
    respond_with @counterparty
  end

  def counterparty_params
    params.require(:counterparty).permit(:title, :requisites, :contacts, :agreements, :site, :comment, :responsible_user_id)
  end
end

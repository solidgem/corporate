class Web::Projects::FinishesController < Web::Projects::ApplicationController
  before_action :check_availability

  add_breadcrumb

  def new
    @project = resource_project
    authorize @project, :status?
    respond_with @project
  end

  def create
    @project = resource_project
    authorize @project, :status?
    @project.assign_attributes project_params
    @project.finish
    respond_with @project
  end

  private

  def check_availability
    redirect_to resource_project unless resource_project.can_finish?
  end

  def project_params
    params.require(:project).permit(:finish_date, :overdue_kind)
  end
end

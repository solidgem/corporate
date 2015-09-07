class Web::Projects::FinishesController < Web::ApplicationController
  add_breadcrumb
  def new
    @project = Project.find params[:project_id]
    authorize @project
    respond_with @project
  end

  def create
    @project = Project.find params[:project_id]
    authorize @project
    attrs = project_params.merge(status_event: 'finish')
    @project.update attrs
    respond_with @project
  end

  private

  def project_params
    attrs = policy(@project).permitted_attributes
    params.require(:project).permit(attrs)
  end
end

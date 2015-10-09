class Web::Projects::ApplicationController < Web::ApplicationController
  add_breadcrumb {{ url: projects_path }}
  add_breadcrumb {{ title: resource_project, url: project_path(resource_project) }}

  private

  def resource_project
    @resource_project ||= Project.find params[:project_id]
  end
end

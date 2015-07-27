class Web::Tasks::ApplicationController < Web::ApplicationController
  helper_method :resource_task

  add_breadcrumb {{ url: tasks_path }}
  add_breadcrumb {{ title: resource_task, url: task_path(resource_task) }}

  private

  def resource_task
    @resource_task ||= Task.find params[:task_id]
  end
end

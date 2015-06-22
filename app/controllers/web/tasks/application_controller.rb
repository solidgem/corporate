class Web::Tasks::ApplicationController < Web::ApplicationController
  helper_method :resource_task

  private

  def resource_task
    @resource_task ||= Task.find params[:task_id]
  end
end

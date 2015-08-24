class Web::TasksController < Web::ApplicationController
  add_breadcrumb {{ url: tasks_path }}

  def index
    authorize :task
    task_params = { status_in: 'active' }.merge(params.fetch(:q, {}))
    @q = policy_scope(Task).search(task_params)
    @q.sorts = 'id desc' if @q.sorts.empty?
    @tasks = @q.result(distinct: true).preload(:responsible_user, :creator, :users, :project).page(params[:page])
    respond_with @tasks
  end

  def show
    @task = Task.find params[:id]
    authorize @task
    add_breadcrumb model: @task
    respond_with @task
  end

  def new
    @task = current_user.created_tasks.new
    authorize @task
    add_breadcrumb
    respond_with @task
  end

  def create
    @task = current_user.created_tasks.build
    authorize @task
    add_breadcrumb
    @task.update task_params
    TaskNotificationService.notification_on_create(@task)
    respond_with @task
  end

  def edit
    @task = Task.find params[:id]
    authorize @task
    add_breadcrumb model: @task
    respond_with @task
  end

  def update
    @task = Task.find params[:id]
    authorize @task
    add_breadcrumb model: @task
    @task.update task_params
    respond_with @task
  end

  def status
    @task = Task.find params[:id]
    authorize @task
    @task.update status_event: params[:event]
    respond_with @task
  end

  private

  def task_params
    attrs = policy(@task).permitted_attributes
    params.require(:task).permit(attrs)
  end

end

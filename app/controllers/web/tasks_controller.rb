class Web::TasksController < Web::ApplicationController
  def index
    authorize :task
    @q = policy_scope(Task).search(params[:q])
    @q.sorts = 'id desc' if @q.sorts.empty?
    @tasks = @q.result.includes(:responsible_user, :users).page(params[:page])
    respond_with @tasks
  end

  def show
    @task = Task.find params[:id]
    authorize @task
    respond_with @task
  end

  def new
    authorize :task
    @task = current_user.created_tasks.new
    respond_with @task
  end

  def create
    authorize :task
    @task = current_user.created_tasks.create task_params
    respond_with @task
  end

  def edit
    @task = current_user.created_tasks.find params[:id]
    authorize @task
    respond_with @task
  end

  def update
    @task = current_user.created_tasks.find params[:id]
    authorize @task
    @task.update task_params
    respond_with @task
  end

  def destroy
    @task = current_user.created_tasks.find params[:id]
    authorize @task
    @task.destroy
    respond_with @task
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :responsible_user_id, user_ids: [])
  end
end

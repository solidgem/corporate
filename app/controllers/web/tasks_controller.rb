class Web::TasksController < Web::ApplicationController
  def index
    @q = Task.search(params[:q])
    @q.sorts = 'id desc' if @q.sorts.empty?
    @tasks = @q.result.includes(:creator, :users).page(params[:page])
    respond_with @tasks
  end

  def show
    @task = Task.find params[:id]
    respond_with @task
  end

  def new
    @task = current_user.created_tasks.new
    respond_with @task
  end

  def create
    @task = current_user.created_tasks.create task_params
    respond_with @task
  end

  def edit
    @task = current_user.created_tasks.find params[:id]
    respond_with @task
  end

  def update
    @task = current_user.created_tasks.find params[:id]
    @task.update task_params
    respond_with @task
  end

  def destroy
    @task = current_user.created_tasks.find params[:id]
    @task.destroy
    respond_with @task
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :responsible_user_id, user_ids: [])
  end
end

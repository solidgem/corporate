class Web::TasksController < Web::ApplicationController
  def index
    authorize :task
    @q = policy_scope(Task).search(params[:q])
    @q.sorts = 'id desc' if @q.sorts.empty?
    @tasks = @q.result(distinct: true).includes(:responsible_user, :creator, :users).page(params[:page])
    respond_with @tasks
  end

  def show
    @task = Task.find params[:id]
    authorize @task
    respond_with @task
  end

  def new
    @task = current_user.created_tasks.new
    authorize @task
    respond_with @task
  end

  def create
    @task = current_user.created_tasks.build task_params
    authorize @task
    @task.save
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

  private

  def task_params
    params.require(:task).permit(:title, :description, :responsible_user_id, user_ids: [])
  end
end

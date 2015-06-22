class Web::Tasks::CommentsController < Web::Tasks::ApplicationController
  def new
    @comment = resource_task.comments.build
  end

  def create
    attrs = comment_params.merge(user: current_user)
    @comment = resource_task.comments.create attrs
    respond_with @comment, location: resource_task
  end

  private

  def comment_params
    params.require(:task_comment).permit(:content, :elapsed_time)
  end
end

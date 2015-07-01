class Web::Tasks::CommentsController < Web::Tasks::ApplicationController
  def new
    @comment = resource_task.comments.build
    authorize @comment
  end

  def create
    attrs = comment_params.merge(user: current_user)
    @comment = resource_task.comments.build attrs
    authorize @comment
    @comment.save
    NotificationService.notification_on_create_comment(resource_task, @comment, current_user)
    respond_with @comment, location: resource_task
  end

  private

  def comment_params
    params.require(:task_comment).permit(:content, :elapsed_time, :elapsed_time_hours, :elapsed_time_minutes)
  end
end

class Web::Tasks::CommentsController < Web::Tasks::ApplicationController
  add_breadcrumb

  def new
    @comment = resource_task.comments.build
    authorize @comment
    add_breadcrumb
  end

  def create
    attrs = comment_params.merge(user: current_user)
    @comment = resource_task.comments.build attrs
    authorize @comment
    add_breadcrumb
    @comment.save
    CommentNotificationService.on_create(@comment)
    respond_with @comment, location: resource_task
  end

  private

  def comment_params
    params.require(:comment)
        .permit(:content, :elapsed_time, :elapsed_time_hours, :elapsed_time_minutes,
                attachments_files: [], attachments_attributes: [:id, :_destroy])
  end
end

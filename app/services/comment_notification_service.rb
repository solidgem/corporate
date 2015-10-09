module CommentNotificationService
  extend self

  def on_create(comment)
    return if comment.invalid?
    comment.task.members.where.not(id: comment.user_id).find_each do |participant|
      CommentMailer.on_create(participant, comment).deliver_now
    end
  end
end

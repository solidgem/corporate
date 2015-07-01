module CommentNotificationService
  extend self

  def notification_on_create(comment)
    comment.task.members.where.not(id: comment.user_id).find_each do |participant|
      NotificationMailer.comment_create_notification_email(participant, comment).deliver_now
    end
  end
end

module CommentNotificationService
  extend self

  def notification_on_create(comment)
    comment.task.users.find_each do |participant|
      if participant != comment.user
        NotificationMailer.comment_create_notification_email(participant, comment).deliver_now
      end
    end
  end
end

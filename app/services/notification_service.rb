module NotificationService
  extend self

  def notification_on_create_task(task, creator)
    task.users.each do |participant|
      if participant != creator
        NotificationMailer.task_create_notification_email(participant, task).deliver_now
      end
    end
  end

  def notification_on_create_comment(task, comment, creator)
    task.users.each do |participant|
      if participant != creator
        NotificationMailer.comment_create_notification_email(participant, comment).deliver_now
      end
    end
  end
end

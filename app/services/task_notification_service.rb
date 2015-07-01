module TaskNotificationService
  extend self

  def notification_on_create(task)
    task.users.find_each do |participant|
      if participant != task.creator
        NotificationMailer.task_create_notification_email(participant, task).deliver_now
      end
    end
  end
end

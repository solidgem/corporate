module TaskNotificationService
  extend self

  def notification_on_create(task)
    task.members.where.not(id: task.creator_id).find_each do |participant|
      NotificationMailer.task_create_notification_email(participant, task).deliver_now
    end
  end
end

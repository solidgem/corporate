module TaskNotificationService
  extend self

  def on_create(task)
    return if task.invalid?
    task.members.where.not(id: task.creator_id).find_each do |participant|
      TaskMailer.on_create(participant, task).deliver_now
    end
  end
end

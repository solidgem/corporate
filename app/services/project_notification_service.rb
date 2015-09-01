module ProjectNotificationService
  extend self

  def on_create(project)
    ProjectMailer.on_create(project).deliver_now
  end
end

module ProjectNotificationService
  extend self

  def on_create(project)
    return if project.invalid?
    ProjectMailer.on_create(project).deliver_now
  end
end

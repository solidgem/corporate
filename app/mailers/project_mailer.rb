class ProjectMailer < ApplicationMailer
  def on_create(project)
    @user = project.responsible_user
    @project = project
    mail to: @user.email
  end
end

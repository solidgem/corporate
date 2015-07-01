class NotificationMailer < ApplicationMailer
  def task_create_notification_email(user, task)
    @user = user
    @task = task
    mail(to: user.email, subject: t(:mail_task_create_subject))
  end

  def comment_create_notification_email(user, comment)
    @user = user
    @comment = comment
    mail(to: user.email, subject: t(:mail_comment_create_subject))
  end
end

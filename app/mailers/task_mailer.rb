class TaskMailer < ApplicationMailer
  def on_create(user, task)
    @user = user
    @task = task
    mail to: user.email
  end
end

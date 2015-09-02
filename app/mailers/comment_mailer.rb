class CommentMailer < ApplicationMailer
  def on_create(user, comment)
    @user = user
    @comment = comment
    mail to: user.email
  end
end

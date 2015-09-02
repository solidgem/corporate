class InviteMailer < ApplicationMailer
  def  on_create(user)
    @user = user
    mail to: user.email
  end
end

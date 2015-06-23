class InvitationMailer < ApplicationMailer
  def invitation_email(user)
    @user = user
    mail(to: user.email, subject: t(:invite))
  end
end

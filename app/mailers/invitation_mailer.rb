class InvitationMailer < ApplicationMailer
  def  invitation_email(user)
    @user = user
    mail(to: user.email, subject: t(:mail_invite_subject))
  end
end

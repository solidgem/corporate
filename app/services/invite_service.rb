module InviteService
  extend self

  def perform(attrs)
    user = InviteType.create attrs
    InvitationMailer.invitation_email(user).deliver_now if user.valid?
    user
  end
end

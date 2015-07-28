module InviteService
  extend self

  def perform(attrs, inviter)
    attrs.merge! password: SecureRandom.urlsafe_base64(6),
                 inviter: inviter

    user = User.create attrs
    InvitationMailer.invitation_email(user).deliver_now if user.valid?
    user
  end
end

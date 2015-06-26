module InviteService
  extend self

  def perform(attrs, inviter)
    email = attrs[:email]
    return if User.exists? email: email

    attrs.merge! password: SecureRandom.urlsafe_base64(6),
                 inviter: inviter

    user = User.create! attrs
    InvitationMailer.invitation_email(user).deliver_now
    user
  end
end
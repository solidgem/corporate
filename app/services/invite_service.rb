module InviteService
  extend self

  def perform(attrs)
    invite_type = InviteType.create attrs
    InvitationMailer.invitation_email(invite_type).deliver_now if invite_type.valid?
    invite_type
  end
end

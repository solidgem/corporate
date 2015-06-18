module InviteService
  extend self

  def perform(form, inviter)
    email = form.email
    return if User.exists? email: email

    user = User.create! do |u|
      u.email = email
      u.password = SecureRandom.urlsafe_base64 6
      u.inviter = inviter
    end

    #TODO: send email

    user
  end
end
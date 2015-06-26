module UserAuthentication
  extend ActiveSupport::Concern

  included do
    helper_method :current_user, :signed_in?, :signed_out?
  end

  class_methods do
  end

  private

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    @current_user = nil
    session.delete :user_id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) || Guest.new
  end

  def signed_in?
    ! signed_out?
  end

  def signed_out?
    current_user.guest?
  end
end

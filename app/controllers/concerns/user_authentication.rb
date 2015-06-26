module UserAuthentication
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
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
end

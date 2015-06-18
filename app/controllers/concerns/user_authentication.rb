module UserAuthentication
  extend ActiveSupport::Concern

  included do
    helper_method :current_user, :signed_in?, :signed_out?
    before_action :authenticate!
  end

  class_methods do
    def skip_authentication(*args)
      skip_before_action :authenticate!, *args
    end
  end

  private

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session.delete :user_id
  end

  def current_user
    @current_user ||= User.find_by id: session[:user_id]
  end

  def signed_in?
    current_user.present?
  end

  def signed_out?
    ! signed_in?
  end

  def authenticate!
    return if signed_in?
    redirect_to root_path
  end
end

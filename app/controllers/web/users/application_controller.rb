class Web::Users::ApplicationController < Web::ApplicationController
  helper_method :resource_user

  private

  def resource_user
    @resource_user ||= User.find params[:user_id]
  end
end

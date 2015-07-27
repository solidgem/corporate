class Web::Users::ApplicationController < Web::ApplicationController
  helper_method :resource_user

  add_breadcrumb {{ url: users_path }}
  add_breadcrumb {{ title: resource_user, url: user_path(resource_user) }}

  private

  def resource_user
    @resource_user ||= User.find params[:user_id]
  end
end

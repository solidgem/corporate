class Web::ApplicationController < ApplicationController
  include UserAuthentication
  include Breadcrumbs

  self.responder = WebResponder
  respond_to :html

  add_breadcrumb {{ url: root_path }}

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end

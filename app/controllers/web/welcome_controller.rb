class Web::WelcomeController < Web::ApplicationController

  def index
    skip_policy_scope
    authorize :'web/welcome', :index?
  end
end

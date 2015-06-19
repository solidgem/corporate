class Web::ApplicationController < ApplicationController
  include UserAuthentication

  self.responder = WebResponder
  respond_to :html
end

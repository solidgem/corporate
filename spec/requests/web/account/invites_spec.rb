require 'rails_helper'

RSpec.describe 'invites', type: :request do
  let(:user) { create :top_manager }
  before(:each){ sign_in_user user }

  context 'new' do
    it 'render with 200 status' do
      get "/account/invites/new"
      expect(response).to be_success
    end
  end

  context 'create' do
    let(:invite_form_attributes) { attributes_for :invite_form }

    it 'create user' do
      post '/account/invites', invite_form: invite_form_attributes

      expect(response).to be_redirect
    end
  end
end

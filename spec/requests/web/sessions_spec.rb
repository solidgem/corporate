require 'rails_helper'

RSpec.describe 'session', type: :request do
  context 'new' do
    it 'render with 200 status' do
      get "/session/new"
      expect(response).to be_success
    end
  end

  context 'create' do
    let(:user) { create :user }

    it 'sign in user' do
      post "/session", session_form: { email: user.email, password: user.password }
      expect(current_user).to eq(user)
      expect(response).to be_redirect
    end

    it 'not sign in user' do
      post "/session", session_form: { email: user.email, password: 'wrong password' }
      expect(current_user).to be_nil
      expect(response).to be_success
    end
  end

  context 'destroy' do
    let(:user) { create :user }
    before(:each) { sign_in_user user }

    it 'not sign in user' do
      delete "/session"
      expect(current_user).to be_nil
      expect(response).to be_redirect
    end
  end
end

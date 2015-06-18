require 'rails_helper'

RSpec.describe 'session', type: :request do
  context 'new' do
    it 'render with 200 status' do
      get "/session/new"
      expect(response).to be_success
    end
  end

  context 'create' do
    let(:password) { generate :password }
    let(:user) { create :user, password: password }

    it 'sign in user' do
      post "/session", user: { email: user.email, password: password }
      expect(current_user).to eq(user)
      expect(response).to be_redirect
    end

    it 'not sign in user' do
      post "/session", user: { email: user.email, password: 'wrong password' }
      expect(current_user).to be_nil
      expect(response).to be_success
    end
  end

  context 'destroy' do
    let(:password) { generate :password }
    let(:user) { create :user, password: password }
    before(:each) { sign_in user.email, password }

    it 'not sign in user' do
      delete "/session"
      expect(current_user).to be_nil
      expect(response).to be_redirect
    end
  end
end

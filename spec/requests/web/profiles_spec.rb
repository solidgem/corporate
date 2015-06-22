require 'rails_helper'

RSpec.describe 'profiles', type: :request do
  let(:user) { create :user }
  before(:each){ sign_in_user user }

  context 'edit' do
    it 'render with 200 status' do
      get "/profile/edit"
      expect(response).to be_success
    end
  end

  context 'update' do
    let(:email) { generate :email }

    it 'success' do
      patch '/profile', user: { email: email }
      expect(response).to be_redirect
    end
  end
end

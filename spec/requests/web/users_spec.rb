require 'rails_helper'

RSpec.describe 'users', type: :request do
  let(:user) { create :user }
  before(:each){ sign_in_user user }

  context 'index' do
    it 'render with 200 status' do
      get "/users"
      expect(response).to be_success
    end
  end

  context 'show' do
    it 'render with 200 status' do
      get "/users/#{user.id}"
      expect(response).to be_success
    end
  end

  context 'edit' do
    it 'render with 200 status' do
      get "/users/#{user.id}/edit"
      expect(response).to be_success
    end
  end

  context 'update' do
    let(:email) { generate :email }

    it 'success' do
      patch "/users/#{user.id}", user: { email: email }
      expect(response).to be_redirect
    end
  end
end

require 'rails_helper'

RSpec.describe 'profile', type: :request do
  let(:user) { create :user }
  before(:each){ sign_in_user user }

  context 'show' do
    it 'render with 200 status' do
      get "/profile"
      expect(response).to be_success
    end
  end

  context 'edit' do
    it 'render with 200 status' do
      get "/profile/edit"
      expect(response).to be_success
    end
  end

  context 'update' do
    let(:name) { generate :name }

    it 'success' do
      patch "/profile", user: { name: name }
      expect(response).to be_redirect
    end
  end
end

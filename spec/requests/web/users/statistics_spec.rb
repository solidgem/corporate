require 'rails_helper'

RSpec.describe 'users', type: :request do
  let(:user) { create :user }
  before(:each){ sign_in_user user }

  context 'show' do
    let!(:comment) { create 'task/comment', user: user }

    it 'render with 200 status' do
      get "/users/#{user.id}/statistics"
      expect(response).to be_success
    end
  end
end

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

    context 'with filter' do
      let(:filter) {{ user_date_form: { start_date: 1.day.ago, end_date: 1.day.since } }}

      it 'render with 200 status' do
        get "/users/#{user.id}/statistics", filter
        expect(response).to be_success
      end
    end
  end
end

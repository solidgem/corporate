require 'rails_helper'

RSpec.describe 'session', type: :request do
  let(:user) { create :user }
  let(:task) { create :task, creator: user }
  let(:comment_attrs) { attributes_for 'task/comment' }

  before(:each) { sign_in_user user }

  context 'new' do
    it 'render with 200 status' do
      get "/tasks/#{task.id}/comments/new"
      expect(response).to be_success
    end
  end

  context 'create' do
    it 'success' do
      post "/tasks/#{task.id}/comments", task_comment: comment_attrs
      expect(task.comments).to be_exists(content: comment_attrs[:content])
      expect(response).to be_redirect
    end
  end
end

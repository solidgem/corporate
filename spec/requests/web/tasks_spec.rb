require 'rails_helper'

RSpec.describe 'tasks', type: :request do
  let(:user) { create :user }
  let!(:task) { create :task, creator: user }
  let!(:another_task) { create :task, creator: user }
  let!(:comment) { create 'task/comment', task: task }
  let!(:another_comment) { create 'task/comment', task: task }
  let(:task_attrs) { attributes_for :task }

  before(:each) { sign_in_user user }

  context 'index' do
    it 'render with 200 status' do
      get "/tasks"
      expect(response).to be_success
    end
  end

  context 'show' do
    it 'render with 200 status' do
      get "/tasks/#{task.id}"
      expect(response).to be_success
    end
  end

  context 'new' do
    it 'render with 200 status' do
      get "/tasks/new"
      expect(response).to be_success
    end
  end

  context 'create' do
    it 'success' do
      post "/tasks", task: task_attrs
      expect(Task).to be_exists(title: task_attrs[:title])
      expect(response).to be_redirect
    end
  end

  context 'edit' do
    it 'render with 200 status' do
      get "/tasks/#{task.id}/edit"
      expect(response).to be_success
    end
  end

  context 'update' do
    it 'success' do
      patch "/tasks/#{task.id}", task: task_attrs
      expect(task.reload.title).to eq(task_attrs[:title])
      expect(response).to be_redirect
    end
  end

  context 'update status' do
    it 'redirect' do
      patch "/tasks/#{task.id}/status", event: 'archive'
      expect(task.reload).to be_archived
      expect(response).to be_redirect
    end
  end
end

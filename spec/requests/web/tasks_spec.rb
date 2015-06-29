require 'rails_helper'

RSpec.describe 'session', type: :request do
  let(:user) { create :user }
  let(:task) { create :task, creator: user }
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

  context 'create' do
    it 'success' do
      patch "/tasks/#{task.id}", task: task_attrs
      expect(task.reload.title).to eq(task_attrs[:title])
      expect(response).to be_redirect
    end
  end
end

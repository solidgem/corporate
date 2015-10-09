require 'rails_helper'

RSpec.describe 'projects', type: :request do
  let(:user) { create :administrator }
  let!(:project) { create :project }
  let!(:another_project) { create :project }
  let(:project_attrs) { attributes_for :project }

  before(:each) { sign_in_user user }

  context 'index' do
    it 'render with 200 status' do
      get "/projects"
      expect(response).to be_success
    end
  end

  context 'show' do
    let!(:task_1) { create :task, project: project }
    let!(:comment_1_1) { create 'task/comment', task: task_1 }
    let!(:comment_1_2) { create 'task/comment', task: task_1 }

    let!(:task_2) { create :task, project: project }
    let!(:comment_2_1) { create 'task/comment', task: task_2 }
    let!(:comment_2_2) { create 'task/comment', task: task_2 }

    it 'render with 200 status' do
      get "/projects/#{project.id}"
      expect(response).to be_success
    end
  end

  context 'new' do
    it 'render with 200 status' do
      get "/projects/new"
      expect(response).to be_success
    end
  end

  context 'create' do
    it 'success' do
      post "/projects", project: project_attrs
      expect(Project).to be_exists(title: project_attrs[:title])
      expect(response).to be_redirect
    end
  end

  context 'edit' do
    it 'render with 200 status' do
      get "/projects/#{project.id}/edit"
      expect(response).to be_success
    end
  end

  context 'update' do
    it 'success' do
      patch "/projects/#{project.id}", project: project_attrs
      expect(project.reload.title).to eq(project_attrs[:title])
      expect(response).to be_redirect
    end
  end

  context 'status' do
    let(:finished_project) { create :project, deadline: 2.day.since, finished_at: DateTime.current, status: 'finished' }

    it 'success' do
      patch "/projects/#{finished_project.id}/status", event: 'activate'
      finished_project.reload
      expect(finished_project.status).to eq('active')
      expect(response).to be_redirect
    end
  end
end

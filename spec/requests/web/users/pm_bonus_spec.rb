require 'rails_helper'

RSpec.describe 'users', type: :request do
  let(:user) { create :user }
  let(:adminsitrator) { create :administrator }
  let!(:manager) { create :manager }
  let!(:project) { create :project, responsible_user: manager, status: :finished, deadline: 10.days.since, finished_at: DateTime.current }
  let!(:task) { create :task, project: project }
  let!(:comment) { create 'task/comment', task: task, user: user }

  let!(:adminsitrator) { create :administrator }
  before(:each){ sign_in_user adminsitrator }

  context 'show' do
    it 'render with 200 status' do
      get "/users/#{manager.id}/pm_bonus"
      expect(response).to be_success
    end
  end
end

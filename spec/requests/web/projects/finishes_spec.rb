require 'rails_helper'

RSpec.describe 'projects', type: :request do
  let(:user) { create :administrator }
  let!(:project) { create :project, deadline: 1.year.ago }
  let(:project_attrs) { attributes_for :project }

  before(:each) { sign_in_user user }

  context 'new' do
    it 'render with 200 status' do
      get "/projects/#{project.id}/finish/new"
      expect(response).to be_success
    end
  end

  context 'create' do
    it 'render with 200 status' do
      post "/projects/#{project.id}/finish", project: { finished_at: Date.today, overdue_kind: 'company_fault' }
      expect(project.reload.status).to eq("finished")
      expect(response).to be_redirect
    end
  end
end

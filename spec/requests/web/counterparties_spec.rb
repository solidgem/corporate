require 'rails_helper'

RSpec.describe 'counterparties', type: :request do
  let(:user) { create :administrator }
  let!(:counterparty) { create :counterparty }
  let!(:another_counterparty) { create :counterparty }
  let!(:official) { create 'counterparty/official', counterparty: counterparty }
  let!(:another_official) { create 'counterparty/official', counterparty: counterparty }
  let!(:project) { create :project, counterparty: counterparty }
  let!(:another_project) { create :project, counterparty: counterparty }
  let(:counterparty_attrs) { attributes_for :counterparty }

  before(:each) { sign_in_user user }

  context 'index' do
    it 'render with 200 status' do
      get "/counterparties"
      expect(response).to be_success
    end
  end
  context 'show' do
    let!(:counterparty) { create :counterparty }

    it 'render with 200 status' do
      get "/counterparties/#{counterparty.id}"
      expect(response).to be_success
    end
  end

  context 'new' do
    it 'render with 200 status' do
      get "/counterparties/new"
      expect(response).to be_success
    end
  end

  context 'create' do
    it 'success' do
      post "/counterparties", counterparty: counterparty_attrs
      expect(Counterparty).to be_exists(title: counterparty_attrs[:title])
      expect(response).to be_redirect
    end
  end

  context 'edit' do
    it 'render with 200 status' do
      get "/counterparties/#{counterparty.id}/edit"
      expect(response).to be_success
    end
  end

  context 'update' do
    it 'success' do
      patch "/counterparties/#{counterparty.id}", counterparty: counterparty_attrs
      expect(counterparty.reload.title).to eq(counterparty[:title])
      expect(response).to be_redirect
    end
  end
end

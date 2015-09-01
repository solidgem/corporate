require 'rails_helper'

RSpec.describe 'contractors', type: :request do
  let(:user) { create :administrator }
  let!(:contractor) { create :contractor }
  let(:contractor_attrs) { attributes_for :contractor }

  before(:each) { sign_in_user user }

  context 'index' do
    it 'render with 200 status' do
      get "/contractors"
      expect(response).to be_success
    end
  end
  context 'show' do
    let!(:contractor) { create :contractor }

    it 'render with 200 status' do
      get "/contractors/#{contractor.id}"
      expect(response).to be_success
    end
  end

  context 'new' do
    it 'render with 200 status' do
      get "/contractors/new"
      expect(response).to be_success
    end
  end

  context 'create' do
    it 'success' do
      post "/contractors", contractor: contractor_attrs
      expect(Contractor).to be_exists(title: contractor_attrs[:title])
      expect(response).to be_redirect
    end
  end

  context 'edit' do
    it 'render with 200 status' do
      get "/contractors/#{contractor.id}/edit"
      expect(response).to be_success
    end
  end

  context 'update' do
    it 'success' do
      patch "/contractors/#{contractor.id}", contractor: contractor_attrs
      expect(contractor.reload.title).to eq(contractor[:title])
      expect(response).to be_redirect
    end
  end
end

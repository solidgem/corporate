require 'rails_helper'

RSpec.describe 'officials', type: :request do
  let(:user) { create :administrator }
  let!(:counterparty) { create :counterparty }
  let!(:official) { create 'counterparty/official', counterparty: counterparty }
  let(:official_attrs) { attributes_for 'counterparty/official' }

  before(:each) { sign_in_user user }

  context 'show' do
    it 'render with 200 status' do
      get "/counterparties/#{counterparty.id}/officials/#{official.id}"
      expect(response).to be_success
    end
  end

  context 'new' do
    it 'render with 200 status' do
      get "/counterparties/#{counterparty.id}/officials/new"
      expect(response).to be_success
    end
  end

  context 'create' do
    it 'success' do
      post "/counterparties/#{counterparty.id}/officials", official: official_attrs
      expect(counterparty.officials).to be_exists(name: official_attrs[:name])
      expect(response).to be_redirect
    end
  end

  context 'edit' do
    it 'render with 200 status' do
      get "/counterparties/#{counterparty.id}/officials/#{official.id}/edit"
      expect(response).to be_success
    end
  end

  context 'update' do
    it 'success' do
      patch "/counterparties/#{counterparty.id}/officials/#{official.id}", official: official_attrs
      expect(official.reload.name).to eq(official[:name])
      expect(response).to be_redirect
    end
  end
end

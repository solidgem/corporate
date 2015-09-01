require 'rails_helper'

RSpec.describe 'representatives', type: :request do
  let(:user) { create :administrator }
  let!(:contractor) { create :contractor }
  let!(:representative) { create :representative, contractor: contractor }
  let(:representative_attrs) { attributes_for :representative }

  before(:each) { sign_in_user user }

  context 'index' do
    it 'render with 200 status' do
      get "/representatives"
      expect(response).to be_success
    end
  end
  context 'show' do
    let!(:representative) { create :representative }

    it 'render with 200 status' do
      get "/representatives/#{representative.id}"
      expect(response).to be_success
    end
  end

  context 'new' do
    it 'render with 200 status' do
      get "/representatives/new"
      expect(response).to be_success
    end
  end

  context 'create' do
    it 'success' do
      post "/representatives", representative: representative_attrs
      expect(Representative).to be_exists(name: representative_attrs[:name])
      expect(response).to be_redirect
    end
  end

  context 'edit' do
    it 'render with 200 status' do
      get "/representatives/#{representative.id}/edit"
      expect(response).to be_success
    end
  end

  context 'update' do
    it 'success' do
      patch "/representatives/#{representative.id}", representative: representative_attrs
      expect(representative.reload.name).to eq(representative[:name])
      expect(response).to be_redirect
    end
  end
end

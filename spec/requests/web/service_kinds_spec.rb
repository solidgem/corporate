require 'rails_helper'

RSpec.describe 'service_kinds', type: :request do
  let(:service_kind) { create :service_kind }
  let(:administrator) { create :administrator }
  before(:each){ sign_in_user administrator }

  context 'index' do
    it 'render with 200 status' do
      get "/service_kinds"
      expect(response).to be_success
    end
  end

  context 'edit' do
    it 'render with 200 status' do
      get "/service_kinds/#{service_kind.id}/edit"
      expect(response).to be_success
    end
  end

  context 'new' do
    it 'render with 200 status' do
      get "/service_kinds/new"
      expect(response).to be_success
    end
  end

  context 'create' do
    let(:service_kind_attrs) { attributes_for :service_kind }
    it 'success' do
      post "/service_kinds", service_kind: service_kind_attrs
      expect(ServiceKind).to be_exists(code: service_kind_attrs[:code])
      expect(response).to be_redirect
    end
  end

  context 'edit' do
    it 'render with 200 status' do
      get "/service_kinds/#{service_kind.id}/edit"
      expect(response).to be_success
    end
  end

  context 'update' do
    let(:name) { generate :string }

    it 'success' do
      patch "/service_kinds/#{service_kind.id}", service_kind: { name: name }
      expect(response).to be_redirect
    end
  end
end

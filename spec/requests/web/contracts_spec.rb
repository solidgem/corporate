require 'rails_helper'

RSpec.describe 'contracts', type: :request do
  let!(:contract) { create :contract }
  let(:administrator) { create :administrator }
  before(:each){ sign_in_user administrator }

  context 'index' do
    it 'render with 200 status' do
      get "/contracts"
      expect(response).to be_success
    end
  end

  context 'edit' do
    it 'render with 200 status' do
      get "/contracts/#{contract.id}/edit"
      expect(response).to be_success
    end
  end

  context 'new' do
    it 'render with 200 status' do
      get "/contracts/new"
      expect(response).to be_success
    end
  end

  context 'create' do
    let(:contract_attrs) { attributes_for :contract }

    it 'success' do
      post "/contracts/", contract: contract_attrs
      expect(response).to be_redirect
      expect(Contract).to be_exists(order_number: contract_attrs[:order_number])
    end
  end

  context 'show' do
    it 'render with 200 status' do
      get "/contracts/#{contract.id}"
      expect(response).to be_success
    end
  end

  context 'edit' do
    it 'render with 200 status' do
      get "/contracts/#{contract.id}/edit"
      expect(response).to be_success
    end
  end

  context 'update' do
    let(:contract_attrs) { attributes_for :contract }

    it 'success' do
      patch "/contracts/#{contract.id}", contract: contract_attrs
      expect(response).to be_redirect
    end
  end
end

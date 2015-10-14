require 'rails_helper'

RSpec.describe 'appendixes', type: :request do
  let(:user) { create :administrator }
  let!(:contract) { create :contract }
  let!(:appendix) { create 'contract/appendix', contract: contract }
  let!(:other_appendix) { create 'contract/appendix', contract: contract }

  before(:each) { sign_in_user user }

  context 'index' do
    it 'render with 200 status' do
      get "/contracts/#{contract.id}/appendixes/"
      expect(response).to be_success
    end
  end

  context 'new' do
    it 'render with 200 status' do
      get "/contracts/#{contract.id}/appendixes/new"
      expect(response).to be_success
    end
  end

  context 'create' do
    let(:appendix_attrs) { attributes_for 'contract/appendix' }

    it 'success' do
      post "/contracts/#{contract.id}/appendixes/", appendix: appendix_attrs
      expect(response).to be_redirect
      expect(Contract::Appendix).to be_exists(order_number: appendix_attrs[:order_number])
    end
  end

  context 'edit' do
    it 'render with 200 status' do
      get "/contracts/#{contract.id}/appendixes/#{appendix.id}/edit"
      expect(response).to be_success
    end
  end

  context 'update' do
    let(:appendix_attrs) { attributes_for 'contract/appendix' }

    it 'success' do
      patch "/contracts/#{contract.id}/appendixes/#{appendix.id}/", appendix: appendix_attrs
      expect(response).to be_redirect
    end
  end


end

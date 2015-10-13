require 'rails_helper'

RSpec.describe 'supplementary_agreements', type: :request do
  let(:user) { create :administrator }
  let!(:contract) { create :contract }
  let!(:supplementary_agreement) { create 'contract/supplementary_agreement', contract: contract }

  before(:each) { sign_in_user user }

  context 'new' do
    it 'render with 200 status' do
      get "/contracts/#{contract.id}/supplementary_agreements/new"
      expect(response).to be_success
    end
  end

  context 'create' do
    let(:supplementary_agreement_attrs) { attributes_for 'contract/supplementary_agreement' }

    it 'success' do
      post "/contracts/#{contract.id}/supplementary_agreements/", supplementary_agreement: supplementary_agreement_attrs
      expect(response).to be_redirect
      expect(Contract::SupplementaryAgreement).to be_exists(order_number: supplementary_agreement_attrs[:order_number])
    end
  end

  context 'show' do
    it 'render with 200 status' do
      get "/contracts/#{contract.id}/supplementary_agreements/#{supplementary_agreement.id}"
      expect(response).to be_success
    end
  end

  context 'edit' do
    it 'render with 200 status' do
      get "/contracts/#{contract.id}/supplementary_agreements/#{supplementary_agreement.id}/edit"
      expect(response).to be_success
    end
  end

  context 'update' do
    let(:supplementary_agreement_attrs) { attributes_for 'contract/supplementary_agreement' }

    it 'success' do
      patch "/contracts/#{contract.id}/supplementary_agreements/#{supplementary_agreement.id}/", supplementary_agreement: supplementary_agreement_attrs
      expect(response).to be_redirect
    end
  end


end

require 'rails_helper'

RSpec.shared_examples 'act crud' do
  let(:user) { create :administrator }
  let!(:act) { create 'contract/act', document: document }

  before(:each) { sign_in_user user }

  context 'index' do
    it 'render with 200 status' do
      get "/#{document.model_name.route_key}/#{document.id}/acts/"
      expect(response).to be_success
    end
  end

  context 'index' do
    it 'render with 200 status' do
      get "/#{document.model_name.route_key}/#{document.id}/acts/"
      expect(response).to be_success
    end
  end

  context 'new' do
    it 'render with 200 status' do
      get "/#{document.model_name.route_key}/#{document.id}/acts/new"
      expect(response).to be_success
    end
  end

  context 'create' do
    let!(:act_attrs) { attributes_for 'contract/act', document: document }
    it 'render with 200 status' do
      post "/#{document.model_name.route_key}/#{document.id}/acts/", act: act_attrs
      expect(response).to be_redirect
      expect(act.class.all).to be_exists(order_number: act_attrs[:order_number])
    end
  end
end

RSpec.describe 'contract/act', type: :request do

  it_behaves_like 'act crud' do
    let(:document) { create :contract }
  end
end

RSpec.describe 'supplementary_agreement/act', type: :request do
  it_behaves_like 'act crud' do
    let(:document) { create 'contract/supplementary_agreement' }
  end
end

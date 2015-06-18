require 'rails_helper'

RSpec.describe 'welcome', type: :request do
  context 'show' do
    it 'render with 200 status' do
      get "/"
      expect(response).to be_success
    end
  end
end

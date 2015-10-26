require 'rails_helper'

RSpec.describe ReadableAttributesSet do
  let(:readable_attributes) { [:responsible_user] }
  let(:readable_attribute_set) { ReadableAttributesSet.new readable_attributes }

  context '#readable?' do
    it 'return true if readable' do
      expect(readable_attribute_set.readable?('responsible_user')).to eq(true)
      expect(readable_attribute_set.readable?('responsible_user_id')).to eq(true)
    end

    it 'return false if not readable' do
      expect(readable_attribute_set.readable?('counterparty')).to eq(false)
    end
  end
end

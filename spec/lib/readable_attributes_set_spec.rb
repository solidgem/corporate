require 'rails_helper'

RSpec.describe ReadableAttributesSet do
  let(:policy) do
    Class.new do
      def readable_attributes
        %i[responsible_user]
      end
    end
  end

  let(:readable_attribute_set) { ReadableAttributesSet.new(policy.new) }

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

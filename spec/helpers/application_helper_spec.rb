require 'rails_helper'

RSpec.describe ApplicationHelper do
  before do
    controller.singleton_class.class_eval do
      def policy(instance)
        Class.new(ApplicationPolicy) do
          def initialize

          end

          def readable_attributes
            %i[responsible_user]
          end
        end.new
      end
      helper_method :policy
    end
  end

  describe '#readable_tag' do
    let(:not_readable_tag) { helper.readable_tag(:td, :project, :counterparty) { :some_content } }
    let(:readable_tag_with_id) { helper.readable_tag(:td, :project, :responsible_user_id) { :some_content } }
    let(:readable_tag_without_id) { helper.readable_tag(:td, :project, :responsible_user) { :some_content } }

    it 'nil if not readable' do
      expect(not_readable_tag).to be_nil
    end

    it 'nil if not readable and attribute with id' do
      expect(readable_tag_with_id).to be_present
    end

    it 'content_tag if readable and attribute without id' do
      expect(readable_tag_without_id).to be_present
    end
  end
end

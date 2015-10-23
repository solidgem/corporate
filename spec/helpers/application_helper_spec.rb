require 'rails_helper'

module PunditViewPolicy
  extend ActiveSupport::Concern

  included do
    before do
      controller.singleton_class.class_eval do
        def policy(instance)
          Class.new do
            def readable_attributes
              %i[responsible_user]
            end
          end.new
        end
        helper_method :policy
      end
    end
  end
end

RSpec.describe ApplicationHelper do
  include PunditViewPolicy

  describe '#readable_tag' do
    it 'nil if not readable and attribute' do
      expect(helper.readable_tag(:td, :project, :counterparty) { '1' }).to be_nil
    end

    it 'nil if not readable and attribute with id' do
      expect(helper.readable_tag(:td, :project, :responsible_user_id) { '1' }).to be_present
    end

    it 'content_tag if readable' do
      expect(helper.readable_tag(:td, :project, :responsible_user) { '1' }).to be_present
    end
  end
end

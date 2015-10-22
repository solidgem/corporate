require 'rails_helper'

RSpec.describe 'AccessPresenter', type: :presenter do
  let(:fake_presenter) do
    Class.new(BasePresenter) do
      def initialize(model, view_context)
        access_presenter = AccessPresenter.new model, view_context
        super access_presenter, view_context
      end

      def responsible_user
        model.responsible_user
      end
    end
  end

  let(:fake_context) do
    Class.new do
      def initialize(policy)
        @policy = policy
      end

      def policy(*)
        @policy
      end
    end
  end

  let(:fake_project_policy) do
    Class.new do
      def readable_attributes
        %i[responsible_user]
      end
    end
  end

  let(:fake_project_policy_with_id) do
    Class.new do
      def readable_attributes
        %i[responsible_user_id]
      end
    end
  end

  let(:project) { create :project }
  let(:current_user) { create :administrator }

  context 'readable attributes' do
    it 'should return values if association attribute without id readable' do
      context = fake_context.new(fake_project_policy.new)
      presenter = fake_presenter.new(project, context)
      expect(presenter.responsible_user_id).to be_present
      expect(presenter.responsible_user).to be_present
    end

    it 'should return values if association attribute with id readable' do
      context = fake_context.new(fake_project_policy_with_id.new)
      presenter = fake_presenter.new(project, context)
      expect(presenter.responsible_user_id).to be_present
      expect(presenter.responsible_user).to be_present
    end
  end

  context 'not readable attributes' do
    it 'should return nil if association attribute is not readable' do
      context = fake_context.new(fake_project_policy.new)
      presenter = fake_presenter.new(project, context)
      expect(presenter.counterparty_id).to be_nil
      expect(presenter.counterparty).to be_nil
    end
  end
end

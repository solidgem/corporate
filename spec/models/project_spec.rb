require 'rails_helper'

RSpec.describe Project, type: :model do
  context 'with finished status' do
    let(:model) { build :project, status: :finished }

    context 'with overdue' do
      before { model.assign_attributes deadline: 1.week.ago, finished_at: DateTime.current }

      it 'invalid without overdue_kind' do
        expect(model).to be_invalid
      end

      it 'valid with overdue_kind' do
        model.overdue_kind = :company_fault
        expect(model).to be_valid
      end
    end

    context 'without overdue' do
      before { model.assign_attributes deadline: 1.week.since, finished_at: DateTime.current }

      it 'valid without overdue_kind' do
        expect(model).to be_valid
      end

      it 'invalid with overdue_kind' do
        model.overdue_kind = :company_fault
        expect(model).to be_invalid
      end
    end
  end
end

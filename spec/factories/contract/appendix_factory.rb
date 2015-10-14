FactoryGirl.define do
  factory 'contract/appendix' do
    order_number { generate :integer }
    contract_id { create(:contract).id }
    date
    contact_person_id { create(:user).id }
    have_original { generate :boolean }
  end
end

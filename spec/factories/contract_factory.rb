FactoryGirl.define do
  factory :contract do
    order_number { generate :integer }
    service_kind_id { create(:service_kind).id}
    date
    counterparty_id { create(:counterparty).id }
    contact_person_id { create(:user).id }
    have_original { generate :boolean}
  end
end
FactoryGirl.define do
  factory 'contract/act' do
    order_number { generate :integer }
    document_id { create(:contract).id }
    date
    formulation { generate :string }
    sum { generate :int }
  end
end

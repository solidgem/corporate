FactoryGirl.define do
  factory 'counterparty/official' do
    full_name { generate :string }
    counterparty
  end
end

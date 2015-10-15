class User::DateForm < BaseForm
  attribute :start_date, Date, default: ->(*) { Date.current.beginning_of_month }
  attribute :end_date, Date, default: ->(model, _) { model.start_date.next_month }
end

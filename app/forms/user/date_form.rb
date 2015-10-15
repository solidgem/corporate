class User::DateForm < BaseForm
  attribute :start_date, ActiveSupport::TimeWithZone, default: ->(*) { Date.current.beginning_of_month }
  attribute :end_date, ActiveSupport::TimeWithZone, default: ->(model, _) { model.start_date.next_month }
end

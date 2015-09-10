class User::FilterForm < BaseForm
  attribute :start_date, ActiveSupport::TimeWithZone, default: ->(*) { DateTime.current.beginning_of_month }
  attribute :end_date, ActiveSupport::TimeWithZone, default: ->(model, _) { model.start_date.next_month }
end

class User::StatisticsFilterForm < BaseForm
  attribute :start_date, ActiveSupport::TimeWithZone, default: ->(*) { 1.month.ago }
  attribute :end_date, ActiveSupport::TimeWithZone, default: ->(*) { DateTime.current }
end

module Contract::AppendixRepository
  extend ActiveSupport::Concern

  included do
    scope :web, ->{ includes(:attachments, :contact_person) }
  end
end

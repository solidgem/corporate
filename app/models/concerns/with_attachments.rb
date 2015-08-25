module WithAttachments
  extend ActiveSupport::Concern

  included do
    has_many :attachments, as: :entity, inverse_of: :entity, dependent: :destroy
    accepts_nested_attributes_for :attachments, allow_destroy: true
    accepts_attachments_for :attachments, append: true
  end
end
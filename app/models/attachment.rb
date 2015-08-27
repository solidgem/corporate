class Attachment < ActiveRecord::Base
  belongs_to :entity, polymorphic: true
  attachment :file

  validates :entity, presence: true
  validates :file, presence: true
end

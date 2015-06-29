class AvatarUploader < CarrierWave::Uploader::Base
  SMALL_DIMENSIONS = { width: 200, height: 200 }.freeze
  THUMB_DIMENSIONS = { width: 30, height: 30 }.freeze

  include Cloudinary::CarrierWave

  version :small do
    opts = {}
    opts.merge! SMALL_DIMENSIONS
    opts.merge! crop: :thumb, gravity: :face

    cloudinary_transformation opts
  end

  version :thumb do
    opts = {}
    opts.merge! THUMB_DIMENSIONS
    opts.merge! crop: :thumb, gravity: :face

    cloudinary_transformation opts
  end

  def default_url(*)
    "/fallbacks/avatar.svg"
  end
end

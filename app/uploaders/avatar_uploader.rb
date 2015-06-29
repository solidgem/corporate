class AvatarUploader < CarrierWave::Uploader::Base
  SMALL_DIMENSIONS = { width: 200, height: 200 }.freeze
  THUMB_DIMENSIONS = { width: 25, height: 25 }.freeze

  include Cloudinary::CarrierWave

  version :small do
    opts = {}
    opts.merge! SMALL_DIMENSIONS
    opts.merge! radius: 5, crop: :thumb, gravity: :face

    cloudinary_transformation opts
  end

  version :thumb do
    opts = {}
    opts.merge! THUMB_DIMENSIONS
    opts.merge! radius: 3, crop: :thumb, gravity: :face

    cloudinary_transformation opts
  end

  def default_url(*)
    "/fallbacks/avatar.svg"
  end
end

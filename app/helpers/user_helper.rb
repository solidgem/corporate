module UserHelper
  def small_user_avatar(user)
    image_tag user.avatar.small.url, AvatarUploader::SMALL_DIMENSIONS
  end

  def thumb_user_avatar(user)
    image_tag user.avatar.thumb.url, AvatarUploader::THUMB_DIMENSIONS
  end
end

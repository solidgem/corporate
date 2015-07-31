module UserHelper

  def thumb_user_avatar(user)
    opts = {}
    opts.merge! AvatarUploader::THUMB_DIMENSIONS
    opts.merge! data: {toggle: :tooltip, placement: :top}, title: user.name
    link_to user_path user do
      image_tag user.avatar.thumb.url, opts
    end
  end
end

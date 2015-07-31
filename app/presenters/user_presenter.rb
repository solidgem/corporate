class UserPresenter < BasePresenter
  def avatar
    return nil unless model.avatar?
    h.image_tag model.avatar.small.url, AvatarUploader::SMALL_DIMENSIONS
  end

  def requisites
    return unless model.requisites?
    h.markdown model.requisites
  end

  def position
    return unless model.position?
    h.markdown model.position
  end
end

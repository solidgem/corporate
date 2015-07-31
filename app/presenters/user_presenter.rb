class UserPresenter < BasePresenter
  def avatar
    return unless model.avatar?
    h.image_tag model.avatar.small.url, AvatarUploader::SMALL_DIMENSIONS
  end

  def contacts
    return unless model.contacts?
    h.markdown model.contacts
  end

  def requisites
    return unless model.requisites?
    h.markdown model.requisites
  end

  def hour_rate
    return unless model.hour_rate?
    model.hour_rate.to_s(:currency)
  end

  def external_hour_rate
    return unless model.external_hour_rate?
    model.external_hour_rate.to_s(:currency)
  end
end

class UserPresenter < BasePresenter
  def initialize(model, view_context)
    access_presenter = AccessPresenter.new model, view_context
    super access_presenter, view_context
  end

  def name
    h.link_to model.name, model
  end

  def avatar
    return unless model.avatar?
    h.image_tag model.avatar.small.url, AvatarUploader::SMALL_DIMENSIONS
  end

  def avatar_thumb
    opts = {}
    opts.merge! AvatarUploader::THUMB_DIMENSIONS
    opts.merge! data: {toggle: :tooltip, placement: :top}, title: model.name
    h.link_to h.user_path model do
      h.image_tag model.avatar.thumb.url, opts
    end
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

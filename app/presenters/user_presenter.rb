class UserPresenter < BasePresenter
  def initialize(model, view_context)
    access_presenter = AccessPresenter.new model, view_context
    super access_presenter, view_context
  end

  def to_link
    h.link_to model.to_s, model
  end

  def profile_image
    return unless model.profile_image
    h.attachment_image_tag(model, :profile_image, :fill, 200, 200)
  end

  def profile_image_thumb
    image_opts = {width: 25, height: 25}
    image_opts.merge! fallback: '/fallbacks/avatar.svg'
    image_opts.merge! data: {toggle: :tooltip, placement: :top}, title: model.name

    h.link_to h.user_path model do
      h.attachment_image_tag(model.model, :profile_image, :fill, 25, 25, **image_opts)
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

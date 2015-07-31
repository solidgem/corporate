class UserPresenter < BasePresenter
  def avatar
    if @model.avatar?
      h.small_user_avatar @model
    else
      nil
    end
  end

  def requisites
    if @model.requisites?
      h.markdown @model.requisites
    else
      nil
    end
  end

  def position
    if @model.position?
      h.markdown @model.position
    else
      nil
    end
  end
end

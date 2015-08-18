class ProjectPresenter < BasePresenter
  def title
    h.link_to_if h.policy(model).show?, model.title, model
  end

  def updated_at
    h.formatted_date model.updated_at
  end

  def cost
    model.cost.to_s(:currency)
  end
end
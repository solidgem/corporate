class ProjectPresenter < BasePresenter
  def initialize(model, view_context)
    access_presenter = AccessPresenter.new model, view_context
    super access_presenter, view_context
  end

  def title
    h.link_to_if h.policy(model).show?, model.title, model
  end

  def updated_at
    h.formatted_date model.updated_at
  end

  def cost
    return unless model.cost
    model.cost.to_s(:currency)
  end
end

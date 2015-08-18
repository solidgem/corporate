class AccessPresenter < BasePresenter
  def initialize(model, view_context)
    super
    not_access_attributes = model.attribute_names.map(&:to_sym) - view_context.policy(model).readable_attributes
    not_access_attributes.each do |attribute|
      define_singleton_method(attribute) { nil }
      define_singleton_method("#{attribute}?") { false }
    end
  end
end

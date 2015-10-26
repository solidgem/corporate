class AccessPresenter < BasePresenter
  def initialize(model, view_context)
    super
    model.attribute_names.each do |attribute|
      unless view_context.policy(model).readable_attributes.readable? attribute
        define_singleton_method(attribute) { nil }
        define_singleton_method("#{attribute}?") { false }
      end
    end
  end
end

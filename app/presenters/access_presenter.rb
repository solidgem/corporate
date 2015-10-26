class AccessPresenter < BasePresenter
  def initialize(model, view_context)
    super
    model.attribute_names.each do |attribute|
      unless view_context.policy(model).readable_attributes.readable? attribute
        attr_name = attribute.sub(/_id\z/, '')
        define_singleton_method(attr_name) { nil }
        define_singleton_method("#{attr_name}?") { false }

        define_singleton_method("#{attr_name}_id") { nil }
        define_singleton_method("#{attr_name}_id?") { false }
      end
    end
  end
end

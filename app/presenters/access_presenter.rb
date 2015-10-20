class AccessPresenter < BasePresenter
  def initialize(model, view_context)
    super
    not_access_attributes = model.attribute_names.map(&:to_s) - view_context.policy(model).readable_attributes.map(&:to_s)
    not_access_attributes.each do |attribute|
      define_singleton_method(attribute) { nil }
      define_singleton_method("#{attribute}?") { false }

      association_match = attribute.match(/(?<association>.*)_id/)
      if association_match
        association_name = association_match[:association]
        define_singleton_method(association_name) { nil }
      end
    end
  end
end

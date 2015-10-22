class AccessPresenter < BasePresenter
  def initialize(model, view_context)
    super
    not_access_attributes =
        model.attribute_names.map{ |attr| attr.to_s.sub(/_id$/,'')} -
        view_context.policy(model).readable_attributes.map{ |attr| attr.to_s.sub(/_id$/,'')}
    not_access_attributes.each do |attribute|
      define_singleton_method(attribute) { nil }
      define_singleton_method("#{attribute}?") { false }
    end
  end
end

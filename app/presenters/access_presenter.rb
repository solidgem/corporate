class AccessPresenter < BasePresenter
  def initialize(model, view_context)
    super
    readable_set = ReadableAttributesSet.new(view_context.policy(model))
    model.attribute_names.each do |attribute|
      unless readable_set.readable? attribute
        define_singleton_method(attribute) { nil }
        define_singleton_method("#{attribute}?") { false }
      end
    end
  end
end

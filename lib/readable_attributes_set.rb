class ReadableAttributesSet
  def initialize(policy)
    @readable_attributes = policy.readable_attributes
  end

  def readable?(attribute)
    attr_name = attribute.sub(/_id\z/, '')
    @readable_attributes.include?(attr_name.to_sym) || @readable_attributes.include?("#{attr_name}_id".to_sym)
  end
end

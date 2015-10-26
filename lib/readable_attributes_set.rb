class ReadableAttributesSet
  def initialize(attrs)
    @attrs_set = Set.new attrs
  end

  def readable?(attribute)
    attr_name = attribute.to_s.sub(/_id\z/, '')
    @attrs_set.include?(attr_name.to_sym) || @attrs_set.include?("#{attr_name}_id".to_sym)
  end
end

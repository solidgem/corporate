class PunditFormBuilder < SimpleForm::FormBuilder
  def input(attribute_name, options = {}, &block)
    return unless show_attribute? attribute_name
    super(attribute_name, options, &block)
  end


  def show_attribute?(attr_name)
    permitted_attributes = template.policy(object).permitted_attributes
    return true if permitted_attributes.include? attr_name
    return true if permitted_attributes.last.kind_of?(Hash) && permitted_attributes.last.key?(attr_name)
    false
  end
end

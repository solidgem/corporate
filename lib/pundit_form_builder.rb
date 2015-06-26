class PunditFormBuilder < SimpleForm::FormBuilder
  def input(attribute_name, options = {}, &block)
    return unless template.policy(object).permitted_attributes.include? attribute_name
    super(attribute_name, options, &block)
  end
end

class BigTextareaInput < SimpleForm::Inputs::TextInput
  def input_html_options
    { rows: 10 }
  end
end

#FIXME: https://github.com/refile/refile/pull/286

class AttachmentInput < SimpleForm::Inputs::Base
  def input(wrapper_options = nil)
    refile_options = [:presigned, :direct, :multiple]
    merged_input_options = merge_wrapper_options(input_options.slice(*refile_options).merge(input_html_options), wrapper_options)
    @builder.attachment_field(attribute_name, merged_input_options)
  end
end

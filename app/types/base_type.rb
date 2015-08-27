module BaseType
  extend ActiveSupport::Concern

  class_methods do
    def model_name
      superclass.model_name
    end
  end
end

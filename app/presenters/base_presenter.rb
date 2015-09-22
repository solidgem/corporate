# config/initializers/0-core_ext.rb
# class NilClass
#   def to_link
#     self
#   end
# end

class BasePresenter < Delegator
  attr_reader :model, :h
  alias_method :__getobj__, :model

  def initialize(model, view_context)
    @model = model
    @h = view_context
  end

  def inspect
    "#<#{self.class} model: #{model.inspect}>"
  end
end

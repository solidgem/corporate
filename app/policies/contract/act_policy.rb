class Contract::ActPolicy < ApplicationPolicy
  delegate :create?, :update?, to: :document_policy

  def index?
    return true if user.administrator?
    return true if user.manager?
    false
  end

  private

  def document_policy
    @document_policy ||= "#{record.document.model_name}Policy".constantize.new(user, record.document)
  end
end

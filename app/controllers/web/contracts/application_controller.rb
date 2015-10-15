class Web::Contracts::ApplicationController < Web::ApplicationController
  helper_method :resource_contract

  add_breadcrumb {{ url: contracts_path }}
  add_breadcrumb {{ title: resource_contract, url: contract_path(resource_contract) }}

  private

  def resource_contract
    @resource_contract ||= Contract.find params[:contract_id]
  end
end

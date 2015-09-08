class Web::Counterparties::ApplicationController < Web::ApplicationController
  helper_method :resource_counterparty

  add_breadcrumb {{ url: counterparties_path }}
  add_breadcrumb {{ title: resource_counterparty, url: counterparty_path(resource_counterparty) }}

  private

  def resource_counterparty
    @resource_counterparty ||= Counterparty.find params[:counterparty_id]
  end
end

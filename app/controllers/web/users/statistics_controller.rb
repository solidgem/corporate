class Web::Users::StatisticsController < Web::Users::ApplicationController
  def show
    authorize resource_user, :statistics_show?
    @statistics = UserStatisticsQuery.perform resource_user.id, params[:start_date], params[:end_date]
  end
end

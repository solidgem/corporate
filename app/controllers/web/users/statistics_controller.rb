class Web::Users::StatisticsController < Web::Users::ApplicationController
  def show
    auth
    @statistics = UserStatisticsQuery.perform resource_user.id, params[:start_date], params[:end_date]
  end

  private

  def auth
    record = [resource_user, :statistics]
    policies[record] = User::StatisticsPolicy.new(pundit_user, resource_user)
    authorize record
  end
end

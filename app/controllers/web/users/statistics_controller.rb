class Web::Users::StatisticsController < Web::Users::ApplicationController
  def show
    authorize resource_user, :statistics_show?
    add_breadcrumb
    @filter_form = User::StatisticsFilterForm.new params[:user_statistics_filter_form]
    @statistics = UserStatisticsQuery.perform resource_user,
                                              @filter_form.start_date,
                                              @filter_form.end_date
  end
end

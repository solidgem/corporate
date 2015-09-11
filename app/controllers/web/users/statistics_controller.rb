class Web::Users::StatisticsController < Web::Users::ApplicationController
  def show
    authorize resource_user, :statistics_show?
    add_breadcrumb
    @date_form = User::DateForm.new params[:date_form]
    @statistics = UserStatisticsQuery.perform resource_user,
                                              @date_form.start_date,
                                              @date_form.end_date
  end
end

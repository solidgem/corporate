class Web::Users::StatisticsController < Web::Users::ApplicationController
  def show
    authorize resource_user, :statistics_show?
    add_breadcrumb
    @filter_form = User::StatisticsFilterForm.new params[:user_statistics_filter_form]
    @statistics = UserStatisticsQuery.perform resource_user,
                                              @filter_form.start_date,
                                              @filter_form.end_date
    start_date = @filter_form.start_date.to_datetime.strftime('%d.%m.%Y')
    end_date = @filter_form.end_date.to_datetime.strftime('%d.%m.%Y')
    filename = "#{resource_user}-#{start_date}-#{end_date}"
    respond_with do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename='#{filename}.xlsx'"
      }
    end
  end
end

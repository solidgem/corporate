class Web::Users::StatisticsController < Web::Users::ApplicationController
  def show
    authorize resource_user, :statistics_show?
    add_breadcrumb
    @date_form = User::DateForm.new params[:user_date_form]
    @statistics = UserStatisticsQuery.perform resource_user,
                                              @date_form.start_date,
                                              @date_form.end_date
    respond_with do |format|
      format.xlsx do
        start_date = @date_form.start_date.strftime('%d.%m.%Y')
        end_date = @date_form.end_date.strftime('%d.%m.%Y')
        filename = "#{resource_user}-#{start_date}-#{end_date}"
        response.headers['Content-Disposition'] = "attachment; filename='#{filename}.xlsx'"
      end
    end
  end
end

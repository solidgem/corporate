class Web::Users::PmBonusController < Web::Users::ApplicationController
  def show
    authorize resource_user, :pm_bonus_show?
    add_breadcrumb
    @filter_form = User::StatisticsFilterForm.new params[:user_statistics_filter_form]
    @bonuses = ProjectsBonusesQuery.perform(resource_user, @filter_form.start_date, @filter_form.end_date)
  end
end

class Web::Users::PmBonusController < Web::Users::ApplicationController
  def show
    authorize resource_user, :pm_bonus_show?
    @filter_form = User::StatisticsFilterForm.new params[:user_statistics_filter_form]
    # @finished_project = Project.where(finished_at: DateTime.current.beginning_of_month..DateTime.current.end_of_month)
    # @finished_projects = Project.where(finished_at: @filter_form.start_date..@filter_form.end_date).where(responsible_user: resource_user)
    @bonuses = ProjectsBonusesQuery.perform(resource_user, @filter_form.start_date, @filter_form.end_date)
  end
end

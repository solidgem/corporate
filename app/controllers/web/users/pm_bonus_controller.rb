class Web::Users::PmBonusController < Web::Users::ApplicationController
  def show
    authorize resource_user, :pm_bonus_show?
    add_breadcrumb
    @date_form = User::DateForm.new params[:user_date_form]
    @bonuses = ProjectsBonusesQuery.perform(resource_user, @date_form.start_date, @date_form.end_date)
  end
end

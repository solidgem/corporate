class Web::Account::InvitesController < Web::Account::ApplicationController
  add_breadcrumb

  def new
    authorize :invite
    add_breadcrumb
    @user = User.new
  end

  def create
    authorize :invite
    add_breadcrumb
    @user = InviteService.perform user_params, current_user

    if @user.valid?
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :role, :hour_rate, :external_hour_rate)
  end
end

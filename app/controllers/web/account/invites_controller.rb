class Web::Account::InvitesController < Web::Account::ApplicationController
  add_breadcrumb

  def new
    authorize :invite
    add_breadcrumb
    @user = InviteType.new(inviter: current_user)
  end

  def create
    authorize :invite
    add_breadcrumb
    user_params.merge!(inviter: current_user)
    @user = InviteService.perform(user_params)

    if @user.valid?
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :inviter_id, :email, :role, :hour_rate, :external_hour_rate)
  end
end

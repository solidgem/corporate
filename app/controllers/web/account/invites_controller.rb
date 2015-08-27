class Web::Account::InvitesController < Web::Account::ApplicationController
  add_breadcrumb

  def new
    authorize :invite
    add_breadcrumb
    @invite_type = InviteType.new(inviter: current_user)
  end

  def create
    authorize :invite
    add_breadcrumb
    user_params_with_inviter = user_params.merge(inviter: current_user)
    @invite_type = InviteService.perform(user_params_with_inviter)

    if @invite_type.valid?
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

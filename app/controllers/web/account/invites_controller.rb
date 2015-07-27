class Web::Account::InvitesController < Web::Account::ApplicationController
  add_breadcrumb

  def new
    authorize :invite
    add_breadcrumb
    @invite_form = InviteForm.new
  end

  def create
    authorize :invite
    add_breadcrumb
    @invite_form = InviteForm.new invite_form_params
    if @invite_form.valid?
      InviteService.perform @invite_form.attributes, current_user
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def invite_form_params
    params.require(:invite_form).permit(:name, :email, :role)
  end
end

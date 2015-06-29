class Web::ProfilesController < Web::ApplicationController
  def show
    authorize :profile
    @profile = current_user
  end

  def edit
    authorize :profile
  end

  def update
    authorize :profile
    user = User.find(current_user.id)
    user.update(profile_params)
    redirect_to profile_path
  end

  def profile_params
    params.require(:user).permit(policy(:user).permitted_attributes)
  end
end
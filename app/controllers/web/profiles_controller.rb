class Web::ProfilesController < Web::ApplicationController
  def show
    authorize :profile
    @profile = current_user
  end

  def edit
    authorize :profile
  end

  def update
    user = User.find(current_user)
    user.update(params)
  end

  def profile_params
    params.require(:profile).permit(policy(:user).permitted_attributes)
  end
end
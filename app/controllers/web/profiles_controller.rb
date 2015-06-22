class Web::ProfilesController < Web::ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user.clone
    @user.update user_params

    respond_with @user, location: root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

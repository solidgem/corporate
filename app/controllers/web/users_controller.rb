class Web::UsersController < Web::ApplicationController
  def index
    @users = policy_scope(Task)
    respond_with @users
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update user_params

    respond_with @user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

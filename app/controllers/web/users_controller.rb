class Web::UsersController < Web::ApplicationController
  def index
    authorize :user
    @q = policy_scope(User).search(params[:q])
    @users = @q.result.page(params[:page])
    respond_with @users
  end

  def show
    @user = User.find params[:id]
    authorize @user
    respond_with @user
  end

  def edit
    @user = User.find params[:id]
    authorize @user
    respond_with @user
  end

  def update
    @user = User.find params[:id]
    @user.update user_params
    authorize @user
    respond_with @user
  end

  private

  def user_params
    params.require(:user).permit(policy(:user).permitted_attributes)
  end
end

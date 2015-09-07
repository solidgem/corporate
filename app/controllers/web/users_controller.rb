class Web::UsersController < Web::ApplicationController
  add_breadcrumb {{ url: users_path }}

  def index
    authorize :user
    @q = policy_scope(User).search(params[:q])
    @users = @q.result.page(params[:page])
    respond_with @users
  end

  def show
    @user = User.find params[:id]
    add_breadcrumb model: @user
    authorize @user
    respond_with @user
  end

  def edit
    @user = User.find params[:id]
    add_breadcrumb model: @user
    authorize @user
    respond_with @user
  end

  def update
    @user = User.find params[:id]
    add_breadcrumb model: @user
    authorize @user
    @user.update user_params
    respond_with @user
  end

  private

  def user_params
    params.require(:user).permit(policy(:user).permitted_attributes)
  end
end

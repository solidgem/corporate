class Web::SessionsController < Web::ApplicationController
  skip_authentication except: :destroy

  def new
    @user = User.new
  end

  def create
    @user = User.find_by email: user_params[:email]
    if @user.try(:authenticate, user_params[:password])
      sign_in @user
      redirect_to root_path
    else
      @user = User.new user_params
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

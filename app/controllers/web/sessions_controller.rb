class Web::SessionsController < Web::ApplicationController
  def new
    authorize :session
    @session_form = SessionForm.new
  end

  def create
    authorize :session
    @session_form = SessionForm.new session_form_params

    if @session_form.valid?
      sign_in @session_form.user
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    authorize :session
    sign_out
    redirect_to root_path
  end

  private

  def session_form_params
    params.require(:session_form).permit(:email, :password)
  end
end

module AuthenticationTestHelper
  def current_user
    User.find_by id: session[:user_id]
  end

  def sign_in(email, password)
    post "/session", session_form: { email: email, password: password }
  end

  def sign_in_user(user)
    sign_in user.email, user.password
  end
end

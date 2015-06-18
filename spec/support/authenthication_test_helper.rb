module AuthenticationTestHelper
  def current_user
    User.find_by id: session[:user_id]
  end

  def sign_in(email, password)
    post "/session", user: { email: email, password: password }
  end
end

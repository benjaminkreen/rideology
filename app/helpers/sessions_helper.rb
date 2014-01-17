module SessionsHelper
  def current_user
    @current_user ||= User.find_by_token(session[:token])
    @current_user
  end
  
  def log_in!(user)
    session[:token] = user.token
  end
end

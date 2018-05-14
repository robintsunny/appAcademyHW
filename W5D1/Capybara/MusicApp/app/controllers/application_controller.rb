class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def login(user)
    @user = user
    session[:session_token] = user.reset_session_token!
    # redirect_to user_url(user)
  end


  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end


  def logged_in?
    !!current_user
  end



  def current_user
    return nil if session[:session_token] = nil
    @current_user ||= User.find_by(session_token: session[:session_token])
  end



  def require_logged_in
    redirect_to new_session_url unless logged_in
  end


end

class ApplicationController < ActionController::Base
 protect_from_forgery with: :null_session
  before_action :authenticate_user!
  #before_action :require_logged_in, except: [:new, :create, :home]
  helper_method :current_user, :logged_in?

  def logged_in?
    !!current_user
  end

  def require_logged_in
   redirect_to root_path unless logged_in?
  end


  # def current_user
  #   return unless session[:user_id]
  #   @current_user ||= User.find(session[:user_id])
  # end

end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?
  helper_method :log_in
  helper_method :title

  helper MarkdownRendererHelper

  
  def render_error error_type
    error = Moviedb::Application.config.errors[error_type.to_s]
    error["method"] = request.path
    render json: {error: error}, status: error["status"]
  end


  def log_in user
    session[:user_id] = user.id
  end

  def log_out 
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # default page title. Child controllers can override this
  def title
    ""
  end

  def require_current_user
    flash[:alert] = "You can't edit someone else's items." and redirect_to @user unless @user == current_user
  end

  def require_logged_in
    flash[:alert] = "You must sign in in first." and redirect_to '/signin' unless logged_in?
  end
end
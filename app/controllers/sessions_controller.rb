class SessionsController < ApplicationController
  def create
    @user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @user.id
    redirect_to @user
  end

  #signin form
  def new
    flash[:notice] = "You're already logged in" and redirect_to current_user if logged_in?
  end

  if Rails.env.development?
    def create_dev
      @user = User.first
      session[:user_id] = @user.id
      redirect_to @user
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
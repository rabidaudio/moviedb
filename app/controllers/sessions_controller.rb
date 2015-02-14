class SessionsController < ApplicationController
  def create
    @user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @user.id
    redirect_to @user
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
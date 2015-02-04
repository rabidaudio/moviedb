class UsersController < ApplicationController

  def index
    render json: current_user
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end
end
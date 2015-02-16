class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  private
  def title
    @user.name || super
  end
end
class ViewingsController < ApplicationController
  def show
    # @user = User.find(params[:user_id]) || current_user
    @viewing = Viewing.find(params[:id])
  end

  def new
    @viewing = Viewing.new
  end

  def create
    @viewing = Viewing.new params[:viewing].permit(:rating, :comments, :format, :first_time)
    @viewing.save!
    redirect_to @viewing
  end
end
class ViewingsController < ApplicationController
  def show
    # @user = User.find(params[:user_id]) || current_user
    @viewing = Viewing.find(params[:id])
  end

  def new
    @viewing = Viewing.new
  end

  def create
    @viewing = Viewing.new viewing_params
    @viewing.movie = Movie.first #TODO
    @viewing.save!
    redirect_to @viewing
  end


  private
  def viewing_params
     params.require(:viewing).permit(:rating, :comments, :format, :first_time).tap do |v|
      v[:rating] = v[:rating].to_i
      v[:first_time] = v[:first_time] == "1"
    end
  end
end
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

  def index
    if params[:movie_id]
      @movie = Movie.find(params[:movie_id])
      @viewings = @movie.viewings
    elsif params[:user_id]
      @user = User.find(params[:user_id])
      @viewings = @user.viewings
    else
      @viewings = Viewings.all
    end

    @viewings  =   if params[:user_id]
  end


  private
  # convert form data to usable params
  def viewing_params
     params.require(:viewing).permit(:rating, :comments, :format, :first_time).tap do |v|
      v[:rating] = v[:rating].to_i
      v[:first_time] = v[:first_time] == "1"
    end
  end
end
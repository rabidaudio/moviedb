class ViewingsController < ApplicationController
  def show
    @viewing = Viewing.find(params[:id])
    @user =  @viewing.user
    @movie = @viewing.movie
  end

  def new
    @user = User.find params[:user_id] if params[:user_id]
    redirect_to root_url if @user != current_user
    @viewing = Viewing.new
  end

  def create
    @user = User.find params[:user_id]
    render body: "", status: :forbidden if @user != current_user
    
    @viewing = Viewing.new viewing_params
    if params[:viewing][:movie_id]
      @viewing.movie = Movie.find params[:viewing][:movie_id]
    else
      # if params[:viewing][:movie_name].match(/\([0-9]{4}\)$/)
        # movie_name = 
      @viewing.movie = Movie.find params[:viewing][:movie_name]
    end
    @viewing.user = @user
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
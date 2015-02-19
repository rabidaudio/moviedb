require 'date_from_hash' # allow creation of date objects from rails helper

class ViewingsController < ApplicationController
  def show
    @viewing = Viewing.find(params[:id])
    @user =  @viewing.user
  end

  def new
    @user = User.find params[:user_id] if params[:user_id]
    require_current_user
    @viewing = Viewing.new
  end

  def edit
    @viewing = Viewing.find(params[:id])
    @user = @viewing.user
    require_current_user
  end

  def create
    @user = User.find params[:user_id]
    require_current_user

    @viewing = Viewing.new viewing_params
    if params[:viewing][:movie_id]
      @viewing.movie = Movie.find params[:viewing][:movie_id]
    else
      # if params[:viewing][:movie_name].match(/\([0-9]{4}\)$/)
        # movie_name = 
      @viewing.movie = Movie.find params[:viewing][:movie_name]
    end
    @viewing.user = @user
    @viewing.save
    redirect_to @viewing
  end

  def update
    @viewing = Viewing.find params[:id]

    @user = @viewing.user
    require_current_user

    @viewing.update viewing_params
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
      @viewings = Viewing.all
    end
  end


  private
  # convert form data to usable params
  def viewing_params
    params.require(:viewing).permit(:rating, :comments, :format, :first_time, :date, :"date(1i)", :"date(2i)", :"date(3i)", :"date(4i)", :"date(5i)").tap do |v|
      # v[:rating] = params[:rating].to_i
      # v[:first_time] = v[:first_time] == "1"
      # v[:date] = Date.new_from_hash params[:date]
    end
  end
end
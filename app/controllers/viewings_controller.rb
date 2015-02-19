require 'date_from_hash' # allow creation of date objects from rails helper

class ViewingsController < ApplicationController
  def show
    @viewing = Viewing.find(params[:id])
    @user =  @viewing.user
  end

  def new
    @user = current_user
    require_logged_in
    @viewing = Viewing.new
  end

  def edit
    @viewing = Viewing.find(params[:id])
    @user = @viewing.user
    require_current_user
  end

  def create
    @user = current_user
    require_logged_in

    @viewing = Viewing.new viewing_params

    if !params[:viewing][:movie_id].empty?
      @viewing.movie = Movie.find params[:viewing][:movie_id]
    else
      search = {title: params[:movie_name]}
      # If a year was given, use that
      params[:movie_name].match(/(.*) \(([0-9]{4})\)$/) do |m|
        search = {title: m[1], year: m[2]}
      end
      @viewing.movie = Movie.find_by_title search
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
    params.require(:viewing).permit(:rating, :comments, :format, :first_time, :date)
  end
end
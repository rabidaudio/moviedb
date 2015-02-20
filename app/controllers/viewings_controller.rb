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
      @movie = Movie.find_by id: params[:movie_id]
      @viewings = @movie.viewings
    elsif params[:user_id]
      @user = User.find(params[:user_id])
      @viewings = @user.viewings
    else
      @viewings = Viewing.all.limit(50)
    end
    #limit
    @viewings = @viewings.order(date: :desc).limit(20)
  end


  private
  # convert form data to usable params
  def viewing_params
    params.require(:viewing).permit(:rating, :movie_id, :comments, :format, :first_time, :date).tap do |p|
      #fix missing or altered movie_id, (e.g. if live search didn't work)
      if params[:viewing][:movie_id].empty? or params[:movie_name] != Movie.find_by(id: params[:viewing][:movie_id]).try(:title_and_year)
        search = {title: params[:movie_name]}
        # If a year was given, use that
        params[:movie_name].match(/(.*) \(([0-9]{4})\)$/) do |m|
          search = {title: m[1], year: m[2]}
        end
        p[:movie_id] = Movie.find_by_title(search).try(:id)
      end
    end
  end
end
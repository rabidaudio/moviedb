class MoviesController < ApplicationController

  def poster
    @movie = Movie.find(params[:movie_id])
    poster = @movie.poster(params[:size])
    if poster.data
      send_data poster.data, :type => poster.content_type, :disposition => 'inline'
    else
      render body: "", status: :not_found
    end
  end

  # Proxy the search query to OMDB, grabbing from memcache if possible
  def search
    render json: (Rails.cache.fetch(request.fullpath, expires_in: 7.days) do
      Omdb::Api.new.search(params[:q])[:movies]
    end)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  # BLOCKED METHODS
  def index
    render_error :FORBIDDEN
  end

  def create
    render_error :FORBIDDEN
  end

  def edit
    render_error :FORBIDDEN
  end

  def update
    render_error :FORBIDDEN
  end

  def destroy
    render_error :FORBIDDEN
  end

  def new
    render_error :FORBIDDEN
  end

  def title
    @movie.title || super
  end
end


# HTTP Verb Path  Controller#Action Used for
# GET /photos photos#index  display a list of all photos
# GET /photos/new photos#new  return an HTML form for creating a new photo
# POST  /photos photos#create create a new photo
# GET /photos/:id photos#show display a specific photo
# GET /photos/:id/edit  photos#edit return an HTML form for editing a photo
# PATCH/PUT /photos/:id photos#update update a specific photo
# DELETE  /photos/:id photos#destroy  delete a specific photo
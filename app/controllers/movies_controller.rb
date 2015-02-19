class MoviesController < ApplicationController

  def poster
    @movie = Movie.find(params[:movie_id])
    poster = @movie.poster(params[:size])
    if poster.try(:data)
      send_data poster.data, :type => poster.content_type, :disposition => 'inline'
    else
      render body: "", status: :not_found
    end
  end

  # Proxy the search query to OMDB, grabbing from memcache if possible
  def search
    render json: (Rails.cache.fetch(request.fullpath, expires_in: 7.days) do
      begin
         Timeout::timeout(3) do
          Omdb::Api.new.search(params[:q])[:movies]
        end
      rescue
        nil
      end
    end)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def title
    @movie.title || super
  end
end
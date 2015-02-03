class MoviesController < ApplicationController

  def get_poster
    data = Movie.find(params[:id]).get_poster
    if data
      send_data blob, :type => 'image/png', :disposition => 'inline'
    else
      render body: nil, status: 404
    end
  end

  def search
    render json: Omdb::Api.new.search(params[:q])[:movies]
  end

  def show
    @movie = Movie.imdb_find params[:id]
    render json: @movie #TODO
  end
end

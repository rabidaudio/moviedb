class Movie < ActiveRecord::Base

  def self.create_from_omdb(omdb_movie)
    Movie.new({
      title:        omdb_movie.title,
      loaded:       omdb_movie.loaded,
      year:         omdb_movie.year,
      rated:        omdb_movie.rated,
      released:     omdb_movie.released,
      runtime:      omdb_movie.runtime,
      genre:        omdb_movie.genre,
      director:     omdb_movie.director,
      writer:       omdb_movie.writer,
      actors:       omdb_movie.actors,
      plot:         omdb_movie.plot,
      imdb_rating:  omdb_movie.imdb_rating,
      imdb_votes:   omdb_movie.imdb_votes,
      imdb_id:      omdb_movie.imdb_id,
      type:         omdb_movie.type,
      metascore:    omdb_movie.metascore,
      language:     omdb_movie.language,
      country:      omdb_movie.country,
      awards:       omdb_movie.awards
    })
  end

  def get_poster
    if poster.nil?
      poster = MovieHelper.get_poster(id)
    end
    poster
  end

  # def get_poster
  #   if poster.nil?
  #     poster = 

  #load by IMDB id, getting from OMDB if it doesn't exist already
  # def self.imdb_find(imdb_id)
  #   find_by(:imdb_id)
  # end
end


# :loaded, :title, :year, :rated, :released, :runtime, :genre, :director, :writer, :actors, :plot,
# :poster, :imdb_rating, :imdb_votes, :imdb_id, :type, :metascore, :language, :country, :awards

#<Omdb::Movie:0x000000057ab110 @title="Star Wars",@year=1983, @imdb_id="tt0251413", @type="game", @rated="N/A", @released="01 May 1983", @runtime="N/A", @genre="Action, Adventure, Sci-Fi", @director="N/A", @writer="N/A", @actors="Harrison Ford, Alec Guinness, Mark Hamill, James Earl Jones", @plot="N/A", @poster="N/A", @metascore="N/A", @language="English", @country="USA", @awards="N/A">
class Movie < ActiveRecord::Base

  def self.imdb_find imdb_id
    m = Movie.find_by(imdb_id: imdb_id)
    if m.nil?
      m = MoviesHelper.fetch(imdb_id)
    end
    m
  end

  # overload accessors to get arrays
  def genre
    convert_arrays(:genre)
  end
  def director
    convert_arrays(:director)
  end
  def writer
    convert_arrays(:writer)
  end
  def actors
    convert_arrays(:actors)
  end

  # convert comma-separated strings to arrays
  private 
  def convert_arrays attribute
    self[attribute].split(",").map{ |s| s.strip } unless self[attribute].nil?
  end


  # def get_poster
  #   if poster.nil?
  #     poster = MovieHelper.get_poster(id)
  #   end
  #   poster
  # end

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
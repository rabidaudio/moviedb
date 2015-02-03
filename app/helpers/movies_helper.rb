module MoviesHelper
  def self.get_poster(imdb_id)
    Net::HTTP.get URI("http://img.omdbapi.com/?apikey=23aff83a&i=#{imdb_id}") #todo handle "Error: API Key Not Valid!"
  end

  def self.fetch(imdb_id)
    m = Movie.new omdb_to_hash(Omdb::Api.new.find(imdb_id)[:movie])
    m.save
    return m
  end

  # TODO convert "N/A" to nil
  private
  def self.omdb_to_hash(omdb_movie)
    {
      title:        omdb_movie.title,
      # loaded:       omdb_movie.loaded,
      year:         omdb_movie.year,
      rated:        omdb_movie.rated,
      runtime:      omdb_movie.runtime,

      released:     Date.parse(omdb_movie.released),

      genre:        cds_to_a(omdb_movie.genre),
      director:     cds_to_a(omdb_movie.director),
      writer:       cds_to_a(omdb_movie.writer),
      actors:       cds_to_a(omdb_movie.actors),
      plot:         omdb_movie.plot,
      imdb_rating:  omdb_movie.imdb_rating,
      imdb_votes:   omdb_movie.imdb_votes,
      imdb_id:      omdb_movie.imdb_id,
      media_type:   omdb_movie.type,
      metascore:    omdb_movie.metascore,
      language:     omdb_movie.language,
      country:      omdb_movie.country,
      awards:       omdb_movie.awards
    }
  end
  # convert comma-delimited strings to arrays
  def self.cds_to_a(string)
    string.split(",").map{ |s| s.strip }
  end
end

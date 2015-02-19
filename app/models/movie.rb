class Movie < ActiveRecord::Base

  has_many :viewings
  has_many :posters

  # overload find: if it isn't in the database already, make one from OMDB
  def self.find imdb_id
    where(id: imdb_id).first_or_create omdb_to_hash(Omdb::Api.new.find(imdb_id)[:movie])
  end

  def self.find_by_title search
    h = omdb_to_hash(Omdb::Api.new.fetch(search[:title], search[:year])[:movie])
    where(search).first_or_create h
  end

  def poster(size=nil)
    if size.nil? and posters.length>0
      posters.order(size: :desc).first    #fetch the largest existing one, or the default if none exist
    else
      Poster.fetch self, (size||300)      #fetch the size requested
    end
  end

  private
  # Convert the Omdb::Movie object to a Hash to be saved as a new Movie
  def self.omdb_to_hash(omdb_movie)

    #copy accessors as hash: http://stackoverflow.com/a/16212180
    h = omdb_movie.instance_values.symbolize_keys

    h[:media_type] = h[:type]   # replace reserved word "type"
    h.delete :type
    h[:id] = h[:imdb_id]        # replace imdb_id with id
    h.delete :imdb_id
    h.delete :poster

    # other subsitutions:
    h.each do |key, val|
      h[key] = nil if val == "N/A"
      h[key] = Date.parse(val) if key.in? [:released] #convert to date
      h[key] = val.split(", ") if !val.nil? and key.in? [:genre, :director, :writer, :actors] #convert to arrays
    end
  end
end


#<Movie id: 2, title: "Star Wars", year: 1983, imdb_id: "tt0251413", media_type: "game", released: "1983-05-01", runtime: nil, genre: "Action, Adventure, Sci-Fi", director: nil, writer: nil, actors: "Harrison Ford, Alec Guinness, Mark Hamill, James E...", plot: nil, poster: nil, metascore: nil, language: "English", country: "USA", awards: nil, created_at: "2015-02-03 06:59:27", updated_at: "2015-02-03 06:59:27", rated: nil, imdb_rating: "7.7", imdb_votes: "303", tomato_meter: nil, tomato_rating: nil, tomato_reviews: nil, tomato_fresh: nil, tomato_rotten: nil, tomato_consensus: nil, tomato_user_meter: nil, tomato_user_rating: nil, tomato_user_reviews: nil, dvd: nil, box_office: nil, production: nil, website: nil> 


#<Omdb::Movie:0x000000057ab110 @title="Star Wars",@year=1983, @imdb_id="tt0251413", @type="game", @rated="N/A", @released="01 May 1983", @runtime="N/A", @genre="Action, Adventure, Sci-Fi", @director="N/A", @writer="N/A", @actors="Harrison Ford, Alec Guinness, Mark Hamill, James Earl Jones", @plot="N/A", @poster="N/A", @metascore="N/A", @language="English", @country="USA", @awards="N/A">
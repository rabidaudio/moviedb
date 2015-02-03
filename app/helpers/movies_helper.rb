module MoviesHelper
  def self.get_poster(imdb_id)
    Net::HTTP.get URI("http://img.omdbapi.com/?apikey=23aff83a&i=#{imdb_id}") #todo handle "Error: API Key Not Valid!"
  end

  def self.fetch(imdb_id)
    m = Movie.new omdb_to_hash(Omdb::Api.new.find(imdb_id)[:movie])
    m.save
    return m
  end

  private
  def self.omdb_to_hash(omdb_movie)

    #copy accessors as hash: http://stackoverflow.com/a/16212180
    h = omdb_movie.instance_values.symbolize_keys

    # replace reserved word "type"
    h[:media_type] = h[:type]
    h.delete :type
    h.delete :poster # separate requests for blobs

    # other subsitutions:
    h.each do |key, val|
      puts val
      if val == "N/A"
        h[key] = nil
      elsif key.in? [:released]
        h[key] = Date.parse(val) #convert to date
      end
    end
  end
end

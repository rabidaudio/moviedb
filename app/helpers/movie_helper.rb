module MovieHelper
  def self.get_poster(imdb_id)
    Net::HTTP.get URI("http://img.omdbapi.com/?apikey=23aff83a&i=#{imdb_id}") #todo handle "Error: API Key Not Valid!"
  end
end

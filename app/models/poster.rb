class Poster < ActiveRecord::Base
  belongs_to :movie

  validates :size, presence: true
  validates :movie, presence: true

  def self.fetch movie, size
    poster = find_by movie: movie, size: size
    #if poster doesn't exist in database, or 
    # it does but there is not one available and it has been a week since the last check,
    # make an OMDB request for it
    if poster.nil? or (poster.data.nil? and poster.updated_at < 1.week.ago)
      poster = Poster.new size: size, movie: movie

      key = Moviedb::Application.config.OMDB_KEY
      url = "http://img.omdbapi.com/?apikey=#{key}&i=#{movie.id}&h=#{size||300}"
      response = Net::HTTP.get_response URI(url)
      if response.body != "Error: API Key Not Valid!" and response.code != "404" # and  Digest::MD5.hexdigest(response.body) != "0f61bf6d1829c92c4f5394bed991ebd4"
        poster.content_type = response.content_type || 'image/jpeg'
        poster.data = response.body
      end
      poster.save!
    end
    poster
  end
end

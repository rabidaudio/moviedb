class Viewing < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  #All possible values for rating
  def self.rating_range
    (1..5).to_a 
  end

  validates :rating, numericality: { only_integer: true }, inclusion: { in: self.rating_range }, allow_nil: true

  # required for form helper
  def movie_name
    movie.try(:name)
  end

  def render_comments
    Redcarpet::Markdown.new.render comments
  end

  # Todo add watched_with and recommended_by
end

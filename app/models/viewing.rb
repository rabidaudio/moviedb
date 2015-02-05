class Viewing < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  # required for fucking form helper
  def movie_name
    movie.try(:name)
  end

  def render_comments
    Redcarpet::Markdown.new.render comments
  end

  # Todo add watched_with and recommended_by
end

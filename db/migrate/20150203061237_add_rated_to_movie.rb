class AddRatedToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :rated, :string
    add_column :movies, :imdb_rating, :string
    add_column :movies, :imdb_votes, :string
  end
end

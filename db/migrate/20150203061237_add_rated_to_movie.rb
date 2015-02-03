class AddRatedToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :rated, :string
    add_column :movies, :imdb_rating, :string
    add_column :movies, :imdb_votes, :string
    add_column :movies, :tomato_meter, :string
    add_column :movies, :tomato_rating, :string
    add_column :movies, :tomato_reviews, :string
    add_column :movies, :tomato_fresh, :string
    add_column :movies, :tomato_rotten, :string
    add_column :movies, :tomato_consensus, :string
    add_column :movies, :tomato_user_meter, :string
    add_column :movies, :tomato_user_rating, :string
    add_column :movies, :tomato_user_reviews, :string
    add_column :movies, :dvd, :string
    add_column :movies, :box_office, :string
    add_column :movies, :production, :string
    add_column :movies, :website, :string
  end
end

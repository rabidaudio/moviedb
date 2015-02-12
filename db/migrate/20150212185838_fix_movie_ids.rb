class FixMovieIds < ActiveRecord::Migration
  def change
    change_table :movies do |t|
      t.rename :imdb_id, :id
    end
  end
end

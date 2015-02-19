class ChangePostersMovieIdToString < ActiveRecord::Migration
  def up
    change_column :posters, :movie_id, :string
  end

  def down
    change_column :posters, :movie_id, :integer
  end
end

class ChangeViewingsMovieIdToString < ActiveRecord::Migration
  def up
    change_column :viewings, :movie_id, :string
  end

  def down
    change_column :viewings, :movie_id, :integer
  end
end

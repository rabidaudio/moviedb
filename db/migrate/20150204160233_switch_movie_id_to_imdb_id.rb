class SwitchMovieIdToImdbId < ActiveRecord::Migration
  def change
    remove_column :movies, :id 
    # change_table :movies do |t|
    #   t.rename :imdb_id, :id
    # end
    # add_index :movies, :imdb_id  
  end
end

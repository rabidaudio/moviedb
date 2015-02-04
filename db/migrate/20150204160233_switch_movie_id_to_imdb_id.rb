class SwitchMovieIdToImdbId < ActiveRecord::Migration
  def change
    remove_column :movies, :id 
    # change_table :movies do |t|
    #   t.rename :imdb_id, :id
      # change_column :imdb_id, :primary_key
    # end
    # add_index :movies, :imdb_id  
    execute "ALTER TABLE movies ADD PRIMARY KEY (imdb_id);"
  end
end

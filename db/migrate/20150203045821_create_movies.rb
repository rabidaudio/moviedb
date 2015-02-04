class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :imdb_id, index: true, unique: true
      t.string :media_type
      t.date :released
      t.string :runtime
      t.string :genre
      t.string :director
      t.string :writer
      t.string :actors
      t.string :plot
      t.binary :poster
      t.string :metascore
      t.string :language
      t.string :country
      t.string :awards

      t.timestamps null: false
    end
  end
end

class ChangeMovieStringstoStringArrays < ActiveRecord::Migration
  def change
    remove_column :movies, :genre
    remove_column :movies, :director
    remove_column :movies, :writer
    remove_column :movies, :actors

    add_column :movies, :genre, :string, array: true
    add_column :movies, :director, :string, array: true
    add_column :movies, :writer, :string, array: true
    add_column :movies, :actors, :string, array: true
  end
end

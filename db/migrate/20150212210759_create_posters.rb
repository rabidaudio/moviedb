class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.binary :data
      t.integer :size, index: true
      t.timestamps null: false
      t.belongs_to :movie, index: true
    end
    remove_column :movies, :poster, :binary
  end
end

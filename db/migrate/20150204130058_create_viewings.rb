class CreateViewings < ActiveRecord::Migration
  def change
    create_table :viewings do |t|
      t.belongs_to :user, index: true
      t.belongs_to :movie, index: true

      t.date :date
      t.string :format
      t.string :comments
      t.boolean :first_time
      t.integer :rating

      t.timestamps null: false
    end
  end
end

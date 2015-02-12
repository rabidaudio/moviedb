class AddContentTypeToPoster < ActiveRecord::Migration
  def change
    add_column :posters, :content_type, :string
  end
end

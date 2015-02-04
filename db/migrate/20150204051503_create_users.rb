class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :provider
      t.string :uid
      t.string :name
      t.string :firstname
      t.string :gender
      t.string :locale
      t.string :email
      t.string :image_url
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.boolean :user_password

      t.timestamps null: false
    end
  end
end

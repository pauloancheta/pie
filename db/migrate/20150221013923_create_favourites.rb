class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.references :user, index: true
      t.integer :favourited_user_id

      t.timestamps null: false
    end
    add_foreign_key :favourites, :users
  end
end

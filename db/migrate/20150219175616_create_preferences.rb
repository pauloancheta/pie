class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.references :user, index: true
      t.references :ingredient, index: true

      t.timestamps null: false
    end
    add_foreign_key :preferences, :users
    add_foreign_key :preferences, :ingredients
  end
end

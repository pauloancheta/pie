class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.references :dish, index: true

      t.timestamps null: false
    end
    add_foreign_key :recipes, :dishes
  end
end

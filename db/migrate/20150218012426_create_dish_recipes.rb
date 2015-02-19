class CreateDishRecipes < ActiveRecord::Migration
  def change
    create_table :dish_recipes do |t|
      t.references :recipe, index: true
      t.references :dish, index: true

      t.timestamps null: false
    end
    add_foreign_key :dish_recipes, :recipes
    add_foreign_key :dish_recipes, :dishes
  end
end

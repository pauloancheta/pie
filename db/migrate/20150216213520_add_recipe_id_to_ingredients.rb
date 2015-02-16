class AddRecipeIdToIngredients < ActiveRecord::Migration
  def change
    add_reference :ingredients, :recipe, index: true
    add_foreign_key :ingredients, :recipes
  end
end

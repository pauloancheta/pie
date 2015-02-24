class AddUserIdToRecipe < ActiveRecord::Migration
  def change
    add_reference :recipes, :user, index: true
    add_foreign_key :recipes, :users

    remove_column :ingredients, :recipe_id
  end
end

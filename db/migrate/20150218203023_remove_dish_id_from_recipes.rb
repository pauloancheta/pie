class RemoveDishIdFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :dish_id
  end
end

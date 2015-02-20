class ChangePreferences < ActiveRecord::Migration
  def change
    add_reference :preferences, :recipe, index: true
    add_foreign_key :preferences, :recipes

    remove_column :preferences, :ingredient_id
    add_column :preferences, :diet, :string
  end
end

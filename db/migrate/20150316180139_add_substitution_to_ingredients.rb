class AddSubstitutionToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :substitution, :string
  end
end

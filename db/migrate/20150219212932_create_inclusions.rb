class CreateInclusions < ActiveRecord::Migration
  def change
    create_table :inclusions do |t|
      t.references :recipe, index: true
      t.references :ingredient, index: true

      t.timestamps null: false
    end
    add_foreign_key :inclusions, :recipes
    add_foreign_key :inclusions, :ingredients
  end
end

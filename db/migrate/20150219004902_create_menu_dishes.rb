class CreateMenuDishes < ActiveRecord::Migration
  def change
    create_table :menu_dishes do |t|
      t.references :menu, index: true
      t.references :dish, index: true

      t.timestamps null: false
    end
    add_foreign_key :menu_dishes, :menus
    add_foreign_key :menu_dishes, :dishes
  end
end

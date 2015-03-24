class AddMenuIdToDishes < ActiveRecord::Migration
  def change
    add_reference :dishes, :menu, index: true
    add_foreign_key :dishes, :menus

    drop_table :menu_dishes
  end
end

class AddUserIdToMenu < ActiveRecord::Migration
  def change
    add_reference :menus, :user, index: true
    add_foreign_key :menus, :users
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :email
      t.string :password_digest
      t.boolean :is_admin

      t.timestamps null: false
    end
  end
end

class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :consumer_token, :string
    add_column :users, :omniauth_raw_data, :string
  end
end

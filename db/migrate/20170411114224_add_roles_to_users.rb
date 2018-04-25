class AddRolesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin, :boolean
    add_column :users, :inventory, :boolean
    add_column :users, :recorder, :boolean
  end
end

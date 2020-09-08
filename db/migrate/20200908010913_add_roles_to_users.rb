class AddRolesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin_role, :boolean
    add_column :users, :seller_role, :boolean
    add_column :users, :buyer_role, :boolean
  end
end

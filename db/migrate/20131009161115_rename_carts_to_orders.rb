class RenameCartsToOrders < ActiveRecord::Migration
  def change
    rename_table :carts, :orders
    add_column :orders, :buyer_id, :integer
    add_column :orders, :status, :string
  end
end

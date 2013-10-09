class RenameLineItemsToOredrItems < ActiveRecord::Migration
  def change
    rename_table :line_items, :order_items
    add_column :order_items, :order_id, :integer
    add_column :order_items, :quantity, :integer
    remove_column :order_items, :cart_id, :integer
  end
end

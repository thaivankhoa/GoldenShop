# AddCartIdToOrderItems
class AddCartIdToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :cart_id, :integer
  end
end

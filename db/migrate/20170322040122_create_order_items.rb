class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
    	t.integer :quantity_order
    	t.string :order_item_title
    	t.float :order_item_price
    	t.timestamps
    end
  end
end

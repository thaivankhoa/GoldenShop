# CreateOrderStatus
class CreateOrderStatus < ActiveRecord::Migration[5.0]
  def change
    create_table :order_statuses do |t|
      t.string :status
      t.timestamps
    end
  end
end

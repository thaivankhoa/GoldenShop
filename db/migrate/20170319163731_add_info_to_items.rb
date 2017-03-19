class AddInfoToItems < ActiveRecord::Migration[5.0]
  def change
  	add_column :items, :description, :text
  	add_column :items, :price, :text
  	add_column :items, :quantity_stock, :integer
  	add_column :items, :created_at, :datetime
  	add_column :items, :updated_at, :datetime
  end
end

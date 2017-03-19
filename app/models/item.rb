class Item < ActiveRecord::Base

	validates :title, presence: true, length: {minimum: 3, maximum: 50 }
	validates :description, presence: true, length: { minimum: 10, maximum: 300 }
	validates :price, presence: true
	validates :quantity_stock, presence: true
	validates :user_id, presence: true

end
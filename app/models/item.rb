class Item < ActiveRecord::Base

	belongs_to :user
	has_many :item_categories
	has_many :categories, through: :item_categories
	validates :title, presence: true, length: {minimum: 3, maximum: 50 }
	validates :description, presence: true, length: { minimum: 10, maximum: 300 }
	validates :price, presence: true
	validates :quantity_stock, presence: true
	validates :user_id, presence: true

end
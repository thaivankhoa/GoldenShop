class Category < ActiveRecord::Base
	#associations
	has_many :item_categories
	has_many :items, through: :item_categories
	# validates
	validates :name, presence: true, length: { minimum: 3 , maximum: 25 }
	validates_uniqueness_of :name

end
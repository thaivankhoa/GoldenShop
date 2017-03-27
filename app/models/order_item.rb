# OrderItem
class OrderItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :order
end

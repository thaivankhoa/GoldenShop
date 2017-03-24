class OrderitemsController < ApplicationController


	before_action :set_item, only: [:edit, :update, :show, :destroy]

	def new
		@orderitem = OrderItem.new
	end

	def create
		@orderitem = OrderItem.new(order_item_params)
		@orderitem.cart = Cart.find(session[:cart_id])
		@orderitem.order = Order.last	
		if @orderitem.save 	
				
			flash[:success] = "Order Item was successfully created"
			redirect_to cart_path(@orderitem.cart)
			
		else
			flash[:danger] = "Order Item was unsuccessfully created"
			redirect_to root_path
			
		end
	end

	def destroy
		
	end

	private

		def set_item
			@item = Item.find(params[:id])
		end
		# Category_ids: [] Add for checkbok input
		def order_item_params
			params.require(:order_item).permit(:quantity_order, :order_item_price, :order_item_title)
		end

end		
class OrdersController < ApplicationController

	def index
		
	end

	def new

	end

	def create
		@order = Order.new(order_params)
		if @order.save
			flash[:success] = "Your Order was successfully created"
			redirect_to cart_path(Cart.find(session[:cart_id]))
		else
			render 'new'
		end
	end

	def show

	end

	def destroy

	end

		private
			def order_params
				params.require(:order).permit(:total_price)
			end
	

end		
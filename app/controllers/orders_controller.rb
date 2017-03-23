class OrdersController < ApplicationController

	def index
		
	end

	def new

	end

	def create
		@order = Order.new(order_params)
		@order.user = current_user

		if @order.save
			Cart.find(session[:cart_id]).order_items.each do |item|
				item.order = @order
				item.save
			end	
			debugger
			flash[:success] = "Your Order was successfully created"
			redirect_to order_path(@order)
		else
			render 'new'
		end
	end

	def show
		@order = Order.find(params[:id])
	end

	def destroy

	end

		private
			def order_params
				params.require(:order).permit(:total_price)
			end
	

end		
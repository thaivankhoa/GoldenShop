class CartsController < ApplicationController

	before_action :set_cart, only: [:edit, :update, :show]

	def index
		@carts = Cart.all
		@carts = Cart.paginate(page: params[:page], per_page: 5)
	end

	def new
		
	end

	def create
		
	end

	def update

	end

	def destroy
		
	end

	def show		
		@cart = Cart.find(session[:cart_id])
		
	end

	private
		def cart_params
			params.require(:cart).permit(:cart_id)
		end

		def set_cart
			@cart = Cart.find(params[:id])
		end
		
	

end		
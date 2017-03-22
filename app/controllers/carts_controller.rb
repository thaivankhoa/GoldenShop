class CartsController < ApplicationController

	before_action :set_cart, only: [:edit, :update, :show]

	def index
		@carts = Cart.all
		@carts = Cart.paginate(page: params[:page], per_page: 5)
	end

	def new
		@cart = Cart.new
		flash[:success] = "new cart"
	end

	def create
		@cart = Cart.new
		@cart.save
		flash[:success] = "New cart has been created"
		redirect_to root_path
	end

	def update

	end

	def destroy
		@cart.destroy
		flash[:danger] = "Cart has been destroyed"
	end

	def show

	end

	private
		def cart_params
			params.require(:cart).permit(:cart_id)
		end

		def set_cart
			@cart = Cart.find(params[:id])
		end
		
	

end		
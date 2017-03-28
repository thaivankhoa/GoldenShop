# cart controller
class CartsController < ApplicationController
  before_action :set_cart, only: [:show]

  def index
    @carts = Cart.paginate(page: params[:page], per_page: 5)
  end

  def show
    @cart = Cart.find(session[:cart_id])
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end
end

# OrdersController
class OrdersController < ApplicationController
  before_action :require_user, only: [:show]

  before_action :require_admin, only: [:destroy, :edit, :update]

  def index
    @orders = Order.all
    @orders = Order.paginate(page: params[:page], per_page: 10)
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    if @order.save
      Cart.find(session[:cart_id]).order_items.each do |item|
        item.order = @order
        item.save
      end
      # create new cart
      Cart.find(session[:cart_id]).destroy
      @cart = Cart.new
      @cart.save
      session[:cart_id] = @cart.id
      #
      flash[:success] = 'Your Order was successfully created'
      redirect_to order_path(@order)
    else
      render 'new'
    end
  end

  def update
    @order = Order.find(params[:id])

    if @order.update(order_params)

      flash[:success] = 'Order was succesfully updated'
      redirect_to order_path(@order)
    else
      render 'edit'
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:status, :total_price)
  end

  def require_admin
    return unless logged_in? && !current_user.admin?
    flash[:danger] = 'Only Admin can perform that action'
    redirect_to root_path
  end
end

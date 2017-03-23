class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :require_user

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_cart
    @current_cart = Cart.last
  end

  def logged_in?
  	!!current_user
  end
 
  def require_user
      if !logged_in?
        flash[:danger] = "You must be logged in to perform that action"
        redirect_to root_path
      end
  end

  def current_cart
   @current_cart = Cart.find(session[:cart_id]) if session[:cart_id]
  end

  def current_order
    @current_order = Order.new
  end

end

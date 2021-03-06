# SessionsController
class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    @cart = Cart.new
    @cart.save
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      session[:cart_id] = @cart.id
      flash[:success] = 'Cart create'
      # flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:danger] = 'There was something wrong with your log in
       information'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have logged out'
    redirect_to root_path
  end
end

class SessionsController < ApplicationController

	def new
	
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		@cart = Cart.new
		flash[:success] = "Cart create"
		@cart.save
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			#flash[:success] = "You have successfully logged in"
			redirect_to user_path(user)
		else
			flash.now[:danger] = "There was something wrong with your log in information"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		Cart.last.destroy
		#flash[:success] = "You have logged out"
		redirect_to root_path
	end

end		
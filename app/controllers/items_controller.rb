class ItemsController < ApplicationController

	before_action :set_item, only: [:edit, :update, :show, :destroy]

	def index
		@items = Item.all
		@items = Item.paginate(page: params[:page], per_page: 5)
	end

	def new 
		@item = Item.new
	end

	def edit
		
	end

	def create
		#render plain: params[:article].inspect
		@item = Item.new(item_params)
		@item.user = User.find(2)
		if @item.save 
			flash[:success] = " Item was succesfully created"
			#debugger
			redirect_to item_path(@item)
		else
			render 'new'
		end
	end

	def update
		if @item.update(item_params)
			flash[:success] = "item was succesfully updated"
			redirect_to item_path(@item)
		else
			render 'edit'
		end
	end

	def show	

	end	

	def destroy		
		@item.destroy

		flash[:danger] = "Item was succesfully deleted"

		redirect_to items_path
	end

	private

		def set_item
			@item = Item.find(params[:id])
		end

		def item_params
			params.require(:item).permit(:title, :description, :price, :quantity_stock)
		end

		def require_same_user
			flash[:danger] = "You can only edit or delete your own items"
			redirect_to root_path	
		end

end	
	

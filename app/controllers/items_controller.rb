# IemsController
class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]

  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.search(params[:search]).paginate(page: params[:page], per_page: 5)
    @search = params[:search]
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      flash[:success] = 'Item was succesfully created'
      redirect_to item_path(@item)
    else
      render 'new'
    end
  end

  def update
    if @item.update(item_params)
      flash[:success] = 'item was succesfully updated'
      redirect_to item_path(@item)
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy

    flash[:danger] = 'Item was succesfully deleted'

    redirect_to items_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :price, :quantity_stock, :image, category_ids: [])
  end

  def require_same_user
    return if (current_user != @item.user) || !current_user.admin?
    flash[:danger] = 'You can only edit or delete your own items'
    redirect_to root_path
  end
end

# CategoriesController
class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]

  def index
    @categories = Category.all
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category was successfully created'
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
    @category_items = @category.items.paginate(page: params[:page], per_page: 5)
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:danger] = 'Category and the following items have been deleted'
    redirect_to root_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    return if current_user.admin?
    flash[:danger] = 'Only admin can perform that action'
    redirect_to categories_path
  end
end

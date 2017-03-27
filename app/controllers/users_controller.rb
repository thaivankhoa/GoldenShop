# UsersController
class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  before_action :require_user, only: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  before_action :require_admin, only: [:destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      if params[:user][:avatar].present?
        render :crop
      else
        flash[:success] = 'Welcome to Goldenshop'
        redirect_to root_path
      end
    else
      render 'new'
    end
  end

  def edit; end

  def userorder
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      if params[:user][:avatar].present?
        render :crop
      else
        flash[:success] = 'Your account has successfully edited'
        redirect_to items_path
      end
    else
      render 'edit'
    end
  end

  def show
    @user_items = @user.items.paginate(page: params[:page], per_page: 5)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = 'User and all items created by user have been deleted'
    if !current_user.admin?
      session[:user_id] = nil
    end
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if (current_user != @user) && !current_user.admin?
      flash[:danger] = 'You can only edit your own account'
      redirect_to root_path
    end
  end

  def require_admin
    return unless logged_in? && !current_user.admin?
    flash[:danger] = 'Only Admin can perform that action'
    redirect_to root_path
  end
end

class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:user_id]
      @items = Item.where(user_id: params[:user_id])
    else
      @items = Item.order(updated_at: :desc)
    end
  end

  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews.order(updated_at: :desc)
    @counted = @reviews.count
    @user = User.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      flash[:notice] = 'Item was successfully added'
      redirect_to "/users/user_id/items"
    else
      @users = User.all
      flash[:alert] = 'Item was not added, please fill out all forms properly'
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :user_id)
  end
end

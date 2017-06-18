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
    @item = Item.find(params[:user_id])
    @reviews = @item.reviews.order(updated_at: :desc)
    @counted = @reviews.count
    @review = Review.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      flash[:notice] = 'Item was successfully added'
      redirect_to user_items_path
    else
      @users = User.all
      flash[:alert] = @item.errors.full_messages.join('. ')
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:item_id])
    @review.find(params[:id]).destroy

    redirect_to item_path(@item)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :user_id)
  end
end

class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:user_id]
      @items = Item.where(user_id: params[:user_id]).order(updated_at: :desc)
    else
      @items = Item.order(updated_at: :desc)
    end
  end

  def show
    @item = Item.find(params[:id])
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
      redirect_to user_items_path(current_user)
    else
      @users = User.all
      flash[:alert] = @item.errors.full_messages.join('. ')
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    @review = Review.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update_attributes(item_params)

    if @item.save
      flash[:notice] = "Item successfully updated"
      redirect_to item_path(@item)
    else
      flash[:alert] = "Please check you have filled out all forms properly"
      render 'items/edit'
    end
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

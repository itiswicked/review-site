class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.order(updated_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews.order(updated_at: :desc)
    @user = User.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = 'Item was successfully added'
      redirect_to @item
    else
      @users = User.all
      flash[:alert] = 'Item was not added, please fill out all forms properly'
      render :new
    end
  end
end

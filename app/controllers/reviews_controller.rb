class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:user_id]
      @reviews = Review.where(user_id: params[:user_id]).order(updated_at: :desc)
    else
      @reviews = Review.order(updated_at: :desc)
    end
  end

  def new
    @review = Review.new
  end

  def create
    @item = Item.find(params[:item_id])
    @review = Review.new(review_params)
    @review.item = @item
    @review.user_id = current_user.id

    if @review.save
      flash[:notice] = 'Review was successfully added'
      redirect_to item_path(@item)
    else
      flash[:alert] = 'Review was not added, please fill out all forms properly'
      render 'items/show'
    end
  end

  def edit
    @item = Item.find(params[:item_id])
    @review = Review.find(params[:id])
    @item = @review.item
  end

  def update
    @item = Item.find(params[:item_id])
    @review = Review.find(params[:id])
    @review.update_attributes(review_params)

    if @review.save
      flash[:notice] = 'Review updated successfully'
      redirect_to item_path(@item)
    else
      flash[:alert] = 'Review not update, please try again'
      render 'reviews/edit'
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    @review = Review.find(params[:id]).destroy

    redirect_to item_path(@item)
  end

  private

  def review_params
    params.require(:review).permit(:description)
  end
end

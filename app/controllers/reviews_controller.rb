class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:user_id]
      @reviews = Review.where(user_id: params[:user_id])
    else
      @reviews = Review.order(updated_at: :desc)
    end
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:notice] = 'Item was successfully added'
      redirect_to "/users/user_id/reviews"
    else
      @users = User.all
      flash[:alert] = 'Item was not added, please fill out all forms properly'
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :description, :user_id, :item_id)
  end
end

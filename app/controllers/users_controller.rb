class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @items = @user.items.count
    @last_three_items = @user.items.order(updated_at: :desc).limit(3)
    @reviews = @user.reviews.count
    @last_three_reviews = @user.reviews.order(updated_at: :desc).limit(3)
  end
end

class Api::V1::ReviewsController < ApplicationController
  def index
    binding.pry
    render json: Review.all
  end

  def upvote
    # binding.pry
    @user = current_user
    @review = Review.find(params[:id])
    @review.votes.create
    @exist_vote = Vote.find_by(user: @user, review: @review)
    if @exist_vote && @exist_vote.vote_value == 1
      @exist_vote.destroy!
    else
      @new_vote = Vote.new(user: @user, review: @review)
      @new_vote.vote_value = 1
      @new_vote.save!
    end
  end

  def downvote
    # binding.pry
    @user = current_user
    @review = Review.find(params[:id])
    @review.votes.create
    @exist_vote = Vote.find_by(user: @user, review: @review)
    if @exist_vote && @exist_vote.vote_value == -1
      @exist_vote.destroy!
    else
      @new_vote = Vote.new(user: @user, review: @review)
      @new_vote.vote_value = -1
      @new_vote.save!
    end
  end
end

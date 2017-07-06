class Api::V1::ReviewsController < ApplicationController
  def index
    binding.pry
    render json: Review.all
  end

  def upvote
    @review = Review.find(params[:id])
    @vote = Vote.find_by(user: current_user, review: @review)
    if @vote && @vote.vote_value == 1
      @vote.destroy!
    elsif @vote && @vote.vote_value == -1
      @vote.vote_value = 1
      @vote.save!
    else
      @new_vote = Vote.new(user: current_user, review: @review)
      @new_vote.vote_value = 1
      @new_vote.save!
    end
  end

  def downvote
    @user = current_user
    @review = Review.find(params[:id])
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

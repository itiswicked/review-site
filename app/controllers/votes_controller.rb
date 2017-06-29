class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @vote = Vote.new(user: current_user, review: params[:review_id])
  end
end

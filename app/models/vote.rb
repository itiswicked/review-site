class Vote < ApplicationRecord

  validates :vote_value,  numericality: { greater_than_or_equal_to: -1, less_than_or_equal_to: 1 }

  belongs_to :user
  belongs_to :review
end

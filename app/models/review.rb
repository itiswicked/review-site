class Review < ApplicationRecord
  validates :description, length: { minimum: 50 }, uniqueness: true
  validates :user_id, presence: true
  validates :item_id, presence: true

  belongs_to :user
  belongs_to :item
end

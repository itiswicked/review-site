class Review < ApplicationRecord
  validates :name, presence: true
  validates :description, length: { minimum: 50 }
  validates :user_id, presence: true
  validates :item_id, presence: true

  belongs_to :user
end

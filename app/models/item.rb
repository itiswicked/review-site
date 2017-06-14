class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, length: { minimum: 50 }, uniqueness: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :reviews
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true
  validates :first_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, allow_blank: true
  validates :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, allow_blank: true
end

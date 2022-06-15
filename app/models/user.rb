class User < ApplicationRecord
  has_secure_password

  has_many :reservations
  has_many :tables, through: :reservations

  validates :email, :username, uniqueness: true, presence: true
  validates :password, confirmation: true, presence: true
  validates :password_confirmation, presence: true
end

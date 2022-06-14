class User < ApplicationRecord
  has_secure_password

  validates :email, :username, uniqueness: true, presence: true
  validates :password, confirmation: true, presence: true
  validates :password_confirmation, presence: true
end

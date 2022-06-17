class Food < ApplicationRecord
  has_many :orders
  has_many :bills, through: :orders
end

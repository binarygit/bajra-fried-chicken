class Food < ApplicationRecord
  has_many :orders
  has_many :bills, through: :orders

  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
end

class Bill < ApplicationRecord
  belongs_to :user
  has_many :orders, inverse_of: :bill, dependent: :destroy
  has_many :foods, through: :orders

  accepts_nested_attributes_for :orders
end

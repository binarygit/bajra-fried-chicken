class Bill < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :foods, through: :orders
end

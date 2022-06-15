class Table < ApplicationRecord
  has_one :reservation
  has_one :user, through: :reservation

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end

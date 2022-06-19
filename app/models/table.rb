class Table < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end

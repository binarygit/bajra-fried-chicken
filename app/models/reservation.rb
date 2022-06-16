class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :table

  validates :reserved_for, presence: true
end

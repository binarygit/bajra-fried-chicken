class Order < ApplicationRecord
  belongs_to :bill
  belongs_to :food
end

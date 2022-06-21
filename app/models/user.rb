class User < ApplicationRecord
  has_secure_password

  has_many :reservations
  has_many :tables, through: :reservations
  has_many :bills

  belongs_to :access_level

  before_validation :set_access_level

  validates :email, :username, uniqueness: true, presence: true

  private

  def set_access_level
    admin = AccessLevel.find_by(name: 'admin')
    ordinary = AccessLevel.find_by(name: 'ordinary')

    if email == 'admin@admin.com'
      self.access_level_id = admin.id
    else
      self.access_level_id = ordinary.id
    end
  end
end

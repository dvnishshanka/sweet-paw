class Pet < ApplicationRecord
  has_many :bookings
  validates :name, presence: true
  validates :species, presence: true
  validates :city, presence: true
end

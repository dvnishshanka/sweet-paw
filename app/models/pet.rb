class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :species, presence: true
  validates :city, presence: true
  has_one_attached :photo
end

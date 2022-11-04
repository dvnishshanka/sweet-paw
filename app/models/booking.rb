class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  validates :pet_id, uniqueness: { scope: %i[user_id start_date] }
end

class Review < ApplicationRecord
  belongs_to :pet
  validates :content, length: { minimum: 20 }
end

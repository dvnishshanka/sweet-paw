class Review < ApplicationRecord
  belongs_to :pet
  validates :content, length: { minimum: 10 }
end

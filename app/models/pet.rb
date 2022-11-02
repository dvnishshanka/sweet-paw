class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :address, presence: true
  validates :species, presence: true
  validates :city, presence: true
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :name, :species, :category, :address, :city ],
  using: {
    tsearch: { prefix: true }
  }
end

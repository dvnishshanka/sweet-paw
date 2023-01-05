class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :address, presence: true
  validates :species, presence: true, inclusion: { in: %w[dog cat piglet rabbit squirrel fish monkey],
    allow_nil: false }
  validates :city, presence: true
  has_one_attached :photo
  has_many :reviews, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: %i[name species category address city],
                  using: {
                    tsearch: { prefix: true }
                  }

  def check_species(input)
    case input
    when "dog"
      "dog.png"
    when "cat"
      "cat.png"
    when "piglet"
      "pig.png"
    when "monkey"
      "monkey.png"
    else
      "rabbit.png"
    end
  end
end

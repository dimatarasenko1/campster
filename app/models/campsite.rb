class Campsite < ApplicationRecord
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :unavailables
  belongs_to :user
  AMENITIES = %w(pet\ friendly campfire\ allowed bins toilet)
  validates :title,
            :description,
            :price_per_night,
            :address,
            :postcode,
            :city,
            :country,
            :max_guests, presence: true
  validates :amenities, inclusion: { in: AMENITIES }

  def self.search(options = {})
    Campsite.all
  end
end

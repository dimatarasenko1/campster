class Campsite < ApplicationRecord
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
end

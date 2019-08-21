class Campsite < ApplicationRecord
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :unavailables
  belongs_to :user

  # Validations
  AMENITIES = %w(pet\ friendly campfire\ allowed bins toilet)
  validates :title,
            # :description,
            # :price_per_night,
            :address, presence: true
  #           :postcode,
  #           :city,
  #           :country,
  #           :max_guests, presence: true
  # validates :amenities, inclusion: { in: AMENITIES }
  # App features
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def self.search(options = {})
    Campsite.all
  end
end

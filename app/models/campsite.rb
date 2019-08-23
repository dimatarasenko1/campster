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

  def self.search(campsites, search_dates)
    campsites.each do |campsite|
      campsites = campsites.where("id != ?", campsite.id) unless bookable?(campsite, search_dates)
    end
    campsites
  end

  private

  def self.bookable?(campsite, search_dates)
    closed_dates = []
    campsite.bookings.each do |booking|
      if booking.start_date
        (booking.start_date.to_datetime..(booking.end_date - 1.day).to_datetime).to_a.each { |d| closed_dates << d }
      end
    end
    campsite.unavailables.each do |unavailable|
      if unavailable.start_date
        (unavailable.start_date.to_datetime..(unavailable.end_date - 1.day).to_datetime).to_a.each { |d| closed_dates << d }
      end
    end
    (search_dates & closed_dates.uniq).empty?
  end
end

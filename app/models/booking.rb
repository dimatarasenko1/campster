class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :campsite
  has_many :reviews
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, , :trackable and :omniauthable
  has_many :bookings
  has_many :campsites
  validates :first_name, :last_name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable
  #email is validated automatically by devise
  mount_uploader :photo, PhotoUploader
end

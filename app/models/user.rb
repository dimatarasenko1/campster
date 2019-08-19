class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, , :trackable and :omniauthable
  validates :first_name, :last_name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable
  #email is validated automatically by devise

end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, , :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable
  #email is validated automatically by devise
end

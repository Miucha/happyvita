class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :bookings
  has_many :addresses
  has_many :activities  #, through: :bookings

  has_many :user_interests
  has_many :interests, through: :user_interests

  geocoded_by :localization
  after_validation :geocode, if: :will_save_change_to_localization?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

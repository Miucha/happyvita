class Activity < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  belongs_to :user
  belongs_to :address
  has_many :bookings
  has_many :users, through: :bookings
  has_many :activity_interests
  has_many :interests, through: :activity_interests
end

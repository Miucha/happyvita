class Activity < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :bookings
  has_many :users, through: :bookings
end

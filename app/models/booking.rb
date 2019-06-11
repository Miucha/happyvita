class Booking < ApplicationRecord
  mount_uploader :review_photo, PhotoUploader

  belongs_to :activity
  belongs_to :user
end

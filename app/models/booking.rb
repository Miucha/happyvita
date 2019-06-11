class Booking < ApplicationRecord
  mount_uploader :review_photo, PhotoUploader

  belongs_to :activity
  belongs_to :user

  validates :schedule_date, presence: true

  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    if schedule_date.present? && schedule_date < Date.today
      errors.add(:schedule_date, "passado")
    end
  end
end

class Booking < ApplicationRecord
  mount_uploader :review_photo, PhotoUploader

  belongs_to :activity
  belongs_to :user

  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    if schedule_date.present? && event_date < Date.today
      errors.add(:event_date, "não pode estar no passado")
    end
  end
end

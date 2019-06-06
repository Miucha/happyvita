class Activity < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  belongs_to :address
  has_many :bookings
  # has_many :users, through: :bookings
  has_many :activity_interests
  has_many :interests, through: :activity_interests

  # validates :title, presence: true
  validates :description, presence: true
  validates :event_date, presence: true
  validates :capacity, presence: true
  validates :address_id, presence: true

  validate :event_title
  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    if event_date.present? && event_date < Date.today
      errors.add(:event_date, "não pode estar no passado")
    end
  end

  def event_title
    if event.present?
      errors.add(:event_title, "Nome do evento não pode ficar em branco")
    end
  end
end

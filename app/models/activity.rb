class Activity < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  belongs_to :address
  has_many :bookings
  # has_many :users, through: :bookings
  has_many :activity_interests
  has_many :interests, through: :activity_interests

  validates :title, presence: true
  validates :description, presence: true
  # validates :event_date, presence: true
  # validates :capacity, presence: true
  # validates :address_id, presence: true

  validate :e_date
  validate :e_capacity
  validate :e_address

  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    if event_date.present? && event_date < Date.today
      errors.add(:event_date, "não pode estar no passado")
    end
  end

  def e_date
    if event.present? && event_date.nil?
      errors.add(:event_date, "Data do Evento deve ser selecionada")
    end
  end

  def e_capacity
    if event.present?
      if capacity.nil?
        errors.add(:capacity, "Quantas pessoas podem participar deste evento?")
      elsif !capacity.positive?
        errors.add(:capacity, "O número de pessoas deve ser maior do que 0")
      end
    end
  end

  def e_address
    if event.present? && address_id.nil?
      errors.add(:address_id, "Qual o endereço do evento?")
    end
  end
end

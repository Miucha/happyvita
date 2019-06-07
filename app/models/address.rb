class Address < ApplicationRecord
  belongs_to :user
  has_many :activities

  def full_address
    "#{self.street}, #{self.number}, #{self.city}"
  end

  geocoded_by :full_address
  after_validation :geocode

end

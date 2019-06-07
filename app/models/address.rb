class Address < ApplicationRecord
  belongs_to :user
  has_many :activities

  validates :street, presence: true

end

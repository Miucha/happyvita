class Address < ApplicationRecord
  belongs_to :user
  has_many :activities

  def full_address
    [street, number, city].compact.join(‘, ‘)
  end

  geocoded_by :full_address

end

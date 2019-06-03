class Activity < ApplicationRecord
  belongs_to :user
  has_many :activity_interests
  has_many :interests, through: :activity_interests
end

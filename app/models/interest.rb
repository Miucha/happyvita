class Interest < ApplicationRecord
  has_many :activity_interests
  has_many :activities, through: :activity_interests
end

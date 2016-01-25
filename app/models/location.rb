class Location < ApplicationRecord
  validates :latitude, numericality: true, presence: true
  validates :longitude, numericality: true, presence: true
  validates :message, length: { maximum: 160 }

  belongs_to :team
  validates :team, presence: true
end

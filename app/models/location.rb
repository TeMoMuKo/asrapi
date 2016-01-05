class Location < ApplicationRecord
  validates :latitude, numericality: true, presence: true
  validates :longitude, numericality: true, presence: true

  belongs_to :team
  validates :team, presence: true
end

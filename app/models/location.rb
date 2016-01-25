class Location < ApplicationRecord
  validates :latitude, numericality: true, presence: true, latitude: true
  validates :longitude, numericality: true, presence: true, longitude: true
  validates :message, length: { maximum: 160 }, exclusion: { in: [nil] }

  belongs_to :team
  validates :team, presence: true
end

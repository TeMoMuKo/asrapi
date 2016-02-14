class Location < ApplicationRecord
  default_scope { order('created_at DESC') }
  validates :latitude, numericality: true, presence: true, latitude: true
  validates :longitude, numericality: true, presence: true, longitude: true
  validates :message, length: { in: 0..160 }
  belongs_to :team
  validates :team, presence: true
end

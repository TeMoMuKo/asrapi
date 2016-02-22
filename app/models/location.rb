class Location < ApplicationRecord
  default_scope { order('created_at ASC') }
  validates :latitude, numericality: true, presence: true, latitude: true
  validates :longitude, numericality: true, presence: true, longitude: true
  validates :message, length: { in: 0..160 }
  belongs_to :team
  validates :team, presence: true
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.address = geo.address
      obj.country = geo.country
      obj.country_code = geo.country_code
    end
  end
  after_validation :reverse_geocode, if: ->(obj){ (obj.latitude.present? && obj.longitude.present?) and (obj.latitude_changed? && obj.longitude_changed?) }
end

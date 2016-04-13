class Team < ApplicationRecord
  validates :name, presence: true

  has_many :locations, dependent: :destroy
  has_many :users

  def last_location
    locations.reorder('created_at DESC').first(1)
  end

  def markers
    locations.map { |location| { lat: location.latitude, lng: location.longitude, infowindow: "<strong>#{location.team.name}</strong><br /><small>#{location.created_at.time}</small><br />#{location.message}" }}
  end

  def number
    /\d+/.match(name)
  end

  def to_s
    name
  end
end

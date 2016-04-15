class Team < ApplicationRecord
  include FriendlyId
  friendly_id :name, use: [:slugged]
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
    n = name.delete("^0-9")
    return -1 if n.empty?
    n.to_i
  end

  def to_s
    name
  end
end

class Team < ApplicationRecord
  include ActionView::Helpers::TagHelper
  include FriendlyId
  friendly_id :name, use: [:slugged]
  validates :name, presence: true

  has_many :locations, dependent: :destroy
  has_many :users

  def last_location
    locations.reorder('created_at DESC').first(1)
  end

  def infowindow(location)
     "".html_safe + content_tag(:strong, location.team.name) + content_tag(:br) + content_tag(:small, location.created_at.time) + content_tag(:br) + location.message
  end

  def markers
    locations.map { |location| { lat: location.latitude, lng: location.longitude, infowindow: infowindow(location) }}
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

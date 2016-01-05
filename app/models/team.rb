class Team < ApplicationRecord
  validates :name, presence: true

  has_many :locations, dependent: :destroy

  def last_location
    locations.order('created_at DESC').first(1)
  end

  def to_s
    name
  end
end

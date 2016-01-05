require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test 'should not save a Location without latitude' do
    location = Location.new(longitude: 21.37, team: teams(:team1))
    assert_not location.save, "Saved a Location without latitude"
  end

  test 'should not save a Location without longitude' do
    location = Location.new(latitude: 21.37, team: teams(:team1))
    assert_not location.save, "Saved a Location without longitude"
  end

  test 'should not save a Location without a Team' do
    location = Location.new(latitude: 21.37, longitude: 37.21)
    assert_not location.save, "Saved a Location without a Team"
  end
end

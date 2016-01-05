require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test 'should not save a Team without a name' do
    team = Team.new
    assert_not team.save, "Saved a Team without a name"
  end

  test 'should have Locations association' do
    team = teams(:team1)
    assert team.locations, "Team somehow doesn't have Locations association"
  end

  test 'can have no Locations' do
    team = teams(:team_empty)
    assert_empty team.locations, "Empty Team has some Locations"
  end
end

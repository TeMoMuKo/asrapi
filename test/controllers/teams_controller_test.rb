require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest

  test 'should GET index' do
    get teams_path
    assert_response :success, "Could not fetch the list of Teams"
  end

  test 'should GET show' do
    team = teams(:team1)
    get team_url(team)
    assert_response :success, "Could not fetch Team details"
  end

end

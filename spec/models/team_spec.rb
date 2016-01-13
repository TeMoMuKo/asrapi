require 'rails_helper'

RSpec.describe Team, :type => :model do
  it "should not be created without a name" do
    team = FactoryGirl.build(:team, name: nil)
    expect(team.save).not_to be_truthy
  end

  it "should have Locations association" do
    team = FactoryGirl.create(:team)
    expect(team.locations).to be
  end

  it "can have no Locations" do
    team = FactoryGirl.create(:team)
    expect(team.locations).to be_empty
  end
end

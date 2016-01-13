require 'rails_helper'

RSpec.describe Location, :type => :model do
  it "should not be saved without a latitude" do
    location = FactoryGirl.build(:location, latitude: nil)
    expect(location.save).not_to be_truthy
  end

  it "should not be save without a longitude" do
    location = FactoryGirl.build(:location, longitude: nil)
    expect(location.save).not_to be_truthy
  end

  it "should not be saved without a Team" do
    location = FactoryGirl.build(:location, team: nil)
    expect(location.save).not_to be_truthy
  end
end

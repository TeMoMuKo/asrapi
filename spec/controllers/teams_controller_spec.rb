require 'rails_helper'

RSpec.describe TeamsController, :type => :controller do

  describe "GET #index" do
    it "responds with 200 OK" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #show" do
    it "responds with 200 OK" do
      team = FactoryGirl.create(:team)
      get :show, id: team.id
      expect(response).to have_http_status(:ok)
    end

    it "responds with 404 Not Found" do
      get :show, id: 1
      expect(response).to have_http_status(:not_found)
    end
  end
end

require 'rails_helper'

RSpec.describe LocationsController, :type => :controller do
  def sign_in_as_user(user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @request.headers.merge! user.create_new_auth_token
    sign_in user
    user
  end

  let (:team) { FactoryGirl.create(:team) }
  let (:user1) { team.users.first }
  let (:user2) { team.users.last }

  describe "GET #index" do
    it "responds with 200 OK" do
      get :index, team_id: team.id
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    it "reponds with 201 Created" do
      sign_in_as_user user1
      post :create, location: FactoryGirl.attributes_for(:location)
      expect(response).to have_http_status(:created)
    end

    it "responds with 422 Unprocessable entity" do
      sign_in_as_user user1
      post :create, location: FactoryGirl.attributes_for(:location, latitude: nil)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end

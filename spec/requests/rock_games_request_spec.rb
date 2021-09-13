require 'rails_helper'

RSpec.describe "RockGames", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/rock_games/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/rock_games/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/rock_games/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/rock_games/index"
      expect(response).to have_http_status(:success)
    end
  end

end

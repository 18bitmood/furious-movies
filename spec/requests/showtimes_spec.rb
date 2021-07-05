require 'rails_helper'

RSpec.describe "Showtimes", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/showtimes/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/showtimes/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/showtimes/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/showtimes/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/showtimes/index"
      expect(response).to have_http_status(:success)
    end
  end

end

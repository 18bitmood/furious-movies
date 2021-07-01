require 'rails_helper'

RSpec.describe "Movies", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/movies/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/movies/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/movies/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end

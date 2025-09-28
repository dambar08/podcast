require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /new" do
    it "returns a successful response" do
      get "/new"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /mobile" do
    it "returns a successful response" do
      get "/mobile"
      expect(response).to have_http_status(:ok)
    end
  end
end

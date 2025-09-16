require 'rails_helper'

RSpec.describe "QrCodes", type: :request do
  describe "GET /qr_code/:id" do
    it "renders a QR code as a cacheable SVG image" do
      id = Base64.urlsafe_encode64("http://example.com")

      get qr_code_path(id)

      expect(response).to have_http_status(:success)
      expect(response.content_type).to include("image/svg+xml")

      expect(response.cache_control[:max_age].to_i).to eq 1.year.to_i
      expect(response.cache_control[:public]).to be true
    end
  end
end

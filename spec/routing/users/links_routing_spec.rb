require "rails_helper"

RSpec.describe Users::LinksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/users/links").to route_to("users/links#index")
    end

    it "routes to #new" do
      expect(get: "/users/links/new").to route_to("users/links#new")
    end

    it "routes to #show" do
      expect(get: "/users/links/1").to route_to("users/links#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/users/links/1/edit").to route_to("users/links#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/users/links").to route_to("users/links#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/users/links/1").to route_to("users/links#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/users/links/1").to route_to("users/links#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/users/links/1").to route_to("users/links#destroy", id: "1")
    end
  end
end

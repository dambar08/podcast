require "rails_helper"

RSpec.describe Users::ContributorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/users/contributors").to route_to("users/contributors#index")
    end

    it "routes to #new" do
      expect(get: "/users/contributors/new").to route_to("users/contributors#new")
    end

    it "routes to #show" do
      expect(get: "/users/contributors/1").to route_to("users/contributors#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/users/contributors/1/edit").to route_to("users/contributors#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/users/contributors").to route_to("users/contributors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/users/contributors/1").to route_to("users/contributors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/users/contributors/1").to route_to("users/contributors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/users/contributors/1").to route_to("users/contributors#destroy", id: "1")
    end
  end
end

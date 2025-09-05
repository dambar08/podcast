require "rails_helper"

RSpec.describe Users::EpisodesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/users/episodes").to route_to("users/episodes#index")
    end

    it "routes to #new" do
      expect(get: "/users/episodes/new").to route_to("users/episodes#new")
    end

    it "routes to #show" do
      expect(get: "/users/episodes/1").to route_to("users/episodes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/users/episodes/1/edit").to route_to("users/episodes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/users/episodes").to route_to("users/episodes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/users/episodes/1").to route_to("users/episodes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/users/episodes/1").to route_to("users/episodes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/users/episodes/1").to route_to("users/episodes#destroy", id: "1")
    end
  end
end

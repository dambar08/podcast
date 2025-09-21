require "rails_helper"

RSpec.describe Blog::ArticlesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/blog/articles").to route_to("blog/articles#index")
    end

    it "routes to #new" do
      expect(get: "/blog/articles/new").to route_to("blog/articles#new")
    end

    it "routes to #show" do
      expect(get: "/blog/articles/1").to route_to("blog/articles#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/blog/articles/1/edit").to route_to("blog/articles#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/blog/articles").to route_to("blog/articles#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/blog/articles/1").to route_to("blog/articles#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/blog/articles/1").to route_to("blog/articles#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/blog/articles/1").to route_to("blog/articles#destroy", id: "1")
    end
  end
end
